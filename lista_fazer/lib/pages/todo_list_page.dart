import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adicione uma Tarefa",
                    hintText: "Ex: Escovar os dentes"),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00d7f3),
                    padding:const EdgeInsets.all(13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  )
                )
              ],
            ),
          )
        )
      );
  }
}
