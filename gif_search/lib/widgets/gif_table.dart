import 'package:flutter/material.dart';
import 'package:gif_search/response_giphy.dart';

class GifTable extends StatelessWidget {
  const GifTable(
      {super.key,
      required this.context,
      required this.snapshot,
      required this.responseGif,
      required this.onTap,
      });
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final ResponseGif responseGif;
  final VoidCallback onTap;
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
            child: Image.network(
              snapshot.data['data'][index]['images']['fixed_height']['url'],
              fit: BoxFit.cover,
              height: 300,
            ),
          );
        } else {
          return GestureDetector(
            onTap: onTap,
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
