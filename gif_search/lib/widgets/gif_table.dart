import 'package:flutter/material.dart';
import 'package:gif_search/pages/gif_page.dart';
import 'package:gif_search/response_giphy.dart';

class GifTable extends StatelessWidget {
  const GifTable({
    super.key,
    required this.context,
    required this.snapshot,
    required this.responseGif,
    required this.addGifButton,
  });
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final ResponseGif responseGif;
  final VoidCallback addGifButton;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: responseGif.getCount(snapshot.data['data']),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (responseGif.search == null ||
            index < snapshot.data['data'].length) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> GifPage(gifMap: snapshot.data['data'][index])),);
            },
            child: Image.network(
              snapshot.data['data'][index]['images']['fixed_height']['url'],
              fit: BoxFit.cover,
              height: 300,
            ),
          );
        } else {
          return GestureDetector(
            onTap: addGifButton,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 70,
                ),
                Text(
                  "Carregar mais...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
