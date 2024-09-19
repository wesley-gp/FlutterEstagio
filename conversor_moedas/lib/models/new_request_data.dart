import 'package:flutter/material.dart';

class NewRequestData {
  NewRequestData(
    {required this.dolar,
    required this.euro,
    required this.euroController,
    required this.reaisController});
  final double dolar;
  final double euro;
  final TextEditingController reaisController;
  final TextEditingController euroController;
}
