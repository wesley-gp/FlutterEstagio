import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  bool get isFull => contador == 20;
  bool get isEmpty => contador == 0;
  void decremento() {
    setState(() {
      contador--;
    });
    
  }

  void incremento() {
    setState(() {
      contador++;
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/fundo.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                isFull?"lotado!":"Pode entrar!",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color:isFull? Colors.red : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                "$contador",
                style: const TextStyle(fontSize: 100, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:isEmpty?  const Color.fromARGB(100, 255, 255, 255): Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  onPressed: isEmpty? null : decremento,
                  child: const Text(
                    "Sair",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: isFull?  const Color.fromARGB(100, 255, 255, 255): Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))),
                  onPressed: isFull? null: incremento,
                  child: const Text(
                    "Entrar",
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
      ),
    );
  }
}
