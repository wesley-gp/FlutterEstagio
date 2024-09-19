import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Conversion {
  Conversion();
  
  Future<Map> getData() async {
    const request = "https://api.hgbrasil.com/finance?key=e10ada44";
    http.Response response = await http.get(Uri.parse(request));
    return jsonDecode(response.body);
  }
}
