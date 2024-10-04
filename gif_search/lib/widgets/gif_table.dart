import 'package:flutter/material.dart';

class GifTable extends StatelessWidget {
  const GifTable({super.key, required this.context, required this.snapshot});
  final BuildContext context;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Image.network(snapshot.data['data'][index]['images']['fixed_height']['url']),
        );
      },
    );
  }
}
