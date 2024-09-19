import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textMsg = "Informe seus dados!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Calculadora de IMC",
        ),
        actions: [
          IconButton(
            onPressed: imcNewCalc,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outlined,
              size: 150,
              color: Colors.green,
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Peso (Kg)"),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Altura (cm)"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              onPressed: () {},
              child: const Text(
                "Calcular",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18),
              ),
            ),
            Text(
              textMsg,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                
              ),
            ),
          ],
        ),
      ),
    );
  }

  void imcNewCalc() {
    print("resetado");
  }
}
