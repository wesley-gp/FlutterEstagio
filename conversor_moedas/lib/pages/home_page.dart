import 'package:conversor_moedas/models/new_request_data.dart';
import 'package:conversor_moedas/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:conversor_moedas/conversion.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Conversion conversion = Conversion();
  late double dolar;
  late double euro;
  TextEditingController reaisController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  late NewRequestData data = NewRequestData(
      dolar: dolar,
      euro: euro,
      euroController: euroController,
      reaisController: reaisController,
      dolarController: dolarController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("\$ Conversor \$"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
          future: conversion.getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text("carregando dados"),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("erros no carregamento :("),
                  );
                } else {
                  dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                  euro = snapshot.data!['results']['currencies']['EUR']['buy'];

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          size: 150,
                          color: Colors.amber,
                        ),
                        FormsFieldConversion(
                          preFix: "R\$",
                          controller: reaisController,
                          label: "Reais",
                          onChanged: (value) {
                            conversion.newConversion(data, 0);
                          },
                        ),
                        const Divider(),
                        FormsFieldConversion(
                          preFix: "US\$",
                          controller: dolarController,
                          label: "Dolares",
                          onChanged: (value) {
                            conversion.newConversion(data, 1);
                          },
                        ),
                        const Divider(),
                        FormsFieldConversion(
                          preFix: "€",
                          controller: euroController,
                          label: "Euros",
                          onChanged: (value) {
                            conversion.newConversion(data, 2);
                          },
                        ),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}
