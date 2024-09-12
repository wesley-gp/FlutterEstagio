import 'package:flutter/material.dart';
import 'package:lista_fazer/widgets/task_item.dart';
import 'package:lista_fazer/models/task.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasksList = [];
  final TextEditingController taskController = TextEditingController();
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
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Adicione uma Tarefa",
                            hintText: "Ex: Escovar os dentes"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        String text = taskController.text;
                        setState(() {
                          Task newTask = Task(
                            title: text,
                            data: DateTime.now()
                          );
                          tasksList.add(newTask);
                          taskController.clear();
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListView(
                  shrinkWrap: true,
                  children: [
                    for (Task task in tasksList)
                      TaskItem(
                        task:task,
                      ),
                  ],
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
                      onPressed: () {
                        setState(() {
                          tasksList.clear();
                        });
                      },
                      child: const Text("Limpar Tudo"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
