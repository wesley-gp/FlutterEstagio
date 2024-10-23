import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textMsg = "Informe seus dados!";
  String? kgErrorText;
  String? heightErrorText;
  TextEditingController kgField = TextEditingController();
  TextEditingController heightField = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.person_outlined,
              size: 120,
              color: Colors.green,
            ),
            TextField(
              controller: kgField,
              decoration: InputDecoration(
                labelText: "Peso (Kg)",
                errorText: kgErrorText,
                labelStyle: const TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: heightField,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                errorText: heightErrorText,
                labelStyle: const TextStyle(
                  color: Colors.green,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )),
              onPressed: () {
                String kgText = kgField.text;
                double? kgValue = double.tryParse(kgText);

                String heightText = heightField.text;
                double? heightValue = double.tryParse(heightText);

                if (kgValue == null || heightValue == null) {
                  setState(() {
                    if (kgValue == null) {
                      kgErrorText = "Isso não é um número válido";
                    }
                    if (heightValue == null) {
                      heightErrorText = "Isso não é um número válido";
                    }
                  });
                  return;
                }
                setState(() {
                  kgErrorText = null;
                  heightErrorText = null;
                  double imcValue =
                      kgValue / ((heightValue / 100) * (heightValue / 100));
                  String imcText = imcValue.toStringAsFixed(2);
                  if (imcValue < 18.5) {
                    textMsg = "Magreza: ($imcText) ";
                  } else if (imcValue < 25) {
                    textMsg = "Peso Ideal: ($imcText)";
                  } else if (imcValue < 30) {
                    textMsg = "Sobrepeso: ($imcText), Obesidade tipo 1";
                  } else if (imcValue < 40) {
                    textMsg = "Obeso: ($imcText), Obesidade tipo 2";
                  } else {
                    textMsg = "Obesividade Greve: ($imcText), Obesidade tipo 3";
                  }
                });
              },
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
    kgField.text = "";
    heightField.text = "";
    setState(() {
      textMsg = "";
    });
  }
}
