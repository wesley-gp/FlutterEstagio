import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormsFieldConversion extends StatelessWidget {
   const FormsFieldConversion(
      {required this.controller,
      required this.preFix,
      required this.label,
      required this.onChanged,
      super.key});
  final TextEditingController controller;
  final String preFix;
  final String label;
  final Function(String text) onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(),
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 16,
      ),
      decoration: InputDecoration(
          prefixText: preFix,
          prefixStyle: const TextStyle(
            color: Colors.amber,
            fontSize: 18,
          ),
          labelText: label,
          border: const OutlineInputBorder(),
          labelStyle: const TextStyle(
            color: Colors.amber,
            decorationColor: Colors.amber,
            fontSize: 25,
          )),
    );
  }
}
