import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem( this.title, {super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey.shade200
      ),
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.all(16),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("12/9/2024", style: TextStyle(fontSize: 12),),
          Text(title, 
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}