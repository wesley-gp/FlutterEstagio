import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:conversor_moedas/models/new_request_data.dart';

class Conversion {
  Conversion();
  Future<Map> getData() async {
    const request = "https://api.hgbrasil.com/finance?key=e10ada44";
    http.Response response = await http.get(Uri.parse(request));
    return jsonDecode(response.body);
  }

  void newConversion(NewRequestData data, int indice) {
    switch (indice) {
      case 0:
        double? reais =
            double.tryParse(data.reaisController.text.replaceAll(",", "."));
        if (reais == null) {
          return;
        }
        data.euroController.text =
            (reais / data.euro).toStringAsFixed(2).replaceAll(".", ",");
        data.dolarController.text =
            (reais / data.dolar).toStringAsFixed(2).replaceAll(".", ",");
        break;
      case 1:
        double? dolar =
            double.tryParse(data.dolarController.text.replaceAll(',', '.'));
        if (dolar == null) {
          return;
        }
        data.reaisController.text =
            (dolar * data.dolar).toStringAsFixed(2).replaceAll('.', ',');
        data.euroController.text = (dolar * data.dolar / data.euro)
            .toStringAsFixed(2)
            .replaceAll('.', ',');
        break;
      case 2:
        double? euro =
            double.tryParse(data.euroController.text.replaceAll(',', '.'));
        if (euro == null) {
          return;
        }
        data.reaisController.text =
            (euro * data.euro).toStringAsFixed(2).replaceAll('.', ',');
        data.dolarController.text = (euro * data.euro / data.dolar)
            .toStringAsFixed(2)
            .replaceAll(',', '.');
    }
  }
}
