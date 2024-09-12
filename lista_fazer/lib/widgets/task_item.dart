import 'package:flutter/material.dart';
import 'package:lista_fazer/models/task.dart';


class TaskItem extends StatelessWidget {
  const TaskItem({required this.task, super.key});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.grey.shade200),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            task.data.toString(),
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            task.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
