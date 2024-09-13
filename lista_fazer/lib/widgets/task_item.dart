import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lista_fazer/models/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.task, required this.onDelete, super.key});
  final Task task;
  final Function(Task) onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                onDelete(task);
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              label: "Deletar",
            ),
          ],
        ),
        child: Container(
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey.shade200),

          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yy - HH:mm')
                    .format(task.data), //task.data.toString(),
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                task.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
