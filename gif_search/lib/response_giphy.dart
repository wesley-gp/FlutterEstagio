import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseGif {
  ResponseGif();
  String? search;
  int offSet = 0;
  Future<dynamic> getGifs() async {
    http.Response response;
    if (search == null||search!.isEmpty) {
      response = await http.get(
        Uri.parse(
            "https://api.giphy.com/v1/gifs/trending?api_key=gn2WNXIifqPi9bcOTDRtM9VKWfV6T57z&limit=20&offset=0&rating=g&bundle=messaging_non_clips"),
      );
    } else {
      response = await http.get(
        Uri.parse(
            "https://api.giphy.com/v1/gifs/search?api_key=gn2WNXIifqPi9bcOTDRtM9VKWfV6T57z&q=$search&limit=19&offset=$offSet&rating=g&lang=en&bundle=messaging_non_clips"),
      );
    }
    return jsonDecode(response.body);
  }

  getCount(List data) {
    if (search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }
}
