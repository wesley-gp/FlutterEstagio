import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GifPage extends StatelessWidget {
  const GifPage({super.key, required this.gifMap});
  final Map gifMap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Share.share(gifMap['images']['fixed_height']['url']);
              },
              icon: const Icon(Icons.share))
        ],
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 18,
        ),
        title: Text(gifMap['title']),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network(gifMap['images']['fixed_height']['url']),
      ),
    );
  }
}
