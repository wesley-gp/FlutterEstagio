import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void decremento() {
    print("decremento");
  }

  void incremento() {
    print("incremento");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Pode entrar!",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white
              ),
          ),
          const Text(
            "0",
            style: TextStyle(
              fontSize: 100,
              color: Colors.white
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: decremento,
                child: const Text("Sair",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    ),
                  ),
              ),
              TextButton(
                onPressed: incremento,
                child: const Text("Entrar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    ),
                  ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
