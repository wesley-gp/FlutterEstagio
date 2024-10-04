import 'package:flutter/material.dart';
import 'package:gif_search/response_giphy.dart';

class GifTable extends StatefulWidget {
  const GifTable(
      {super.key,
      required this.context,
      required this.snapshot,
      required this.responseGif});
  final BuildContext context;
  final AsyncSnapshot snapshot;
  final ResponseGif responseGif;

  @override
  State<GifTable> createState() => _GifTableState();
}

class _GifTableState extends State<GifTable> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.responseGif.getCount(widget.snapshot.data['data']),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (widget.responseGif.search == null ||
            index < widget.snapshot.data['data'].length) {
          return GestureDetector(
            child: Image.network(
              widget.snapshot.data['data'][index]['images']['fixed_height']
                  ['url'],
              fit: BoxFit.cover,
              height: 300,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.responseGif.offSet += 19;
              });
              print(widget.responseGif.offSet);
            },
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
