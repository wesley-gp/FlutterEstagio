import 'package:flutter/material.dart';
import 'package:lista_fazer/repositories/task_repository.dart';
import 'package:lista_fazer/widgets/task_item.dart';
import 'package:lista_fazer/models/task.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasksList = [];

  Task? deletedTask;
  int? deletedTaskPos;
  String? errorText;
  bool get isEmpty => tasksList.isEmpty;
  double marginButtom = 0;
  final TextEditingController taskController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  @override
  void initState() {
    super.initState();
    taskRepository.getTaskList().then((value) {
      setState(() {
        tasksList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Adicione uma Tarefa",
                        errorText: errorText,
                        hintText: "Ex: Escovar os dentes"
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    margin: EdgeInsets.only(bottom: marginButtom),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        String text = taskController.text;
                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'a tarefa está vazia!';
                            marginButtom = 20;
                          });

                          return;
                        }

                        setState(() {
                          errorText = null;
                          marginButtom = 0;
                          Task newTask =
                              Task(title: text, data: DateTime.now());
                          tasksList.add(newTask);
                        });
                        taskController.clear();
                        taskRepository.saveTaskList(tasksList);
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasksList.length,
                  itemBuilder: (context, index) {
                    return TaskItem(task: tasksList[index], onDelete: onDelete);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "você possui ${tasksList.length} tarefas pendentes",
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff00d7f3),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: isEmpty ? null : showConfirmationDel,
                    child: const Text("Limpar Tudo"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void onDelete(Task task) {
    deletedTask = task;
    deletedTaskPos = tasksList.indexOf(task);
    setState(() {
      tasksList.remove(task);
    });
    taskRepository.saveTaskList(tasksList);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Tarefa ${task.title} foi removida com sucesso!",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        action: SnackBarAction(
          label: "Desfazer",
          textColor: const Color(0xff00d7f3),
          onPressed: () {
            setState(() {
              tasksList.insert(deletedTaskPos!, deletedTask!);
            });
            taskRepository.saveTaskList(tasksList);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void showConfirmationDel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Limpar tudo"),
        content: const Text("Tem certeza que deseja apagar TODAS as tarefas?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                tasksList.clear();
              });
              taskRepository.saveTaskList(tasksList);
            },
            child: const Text("Excluir"),
          ),
        ],
      ),
    );
  }
}
