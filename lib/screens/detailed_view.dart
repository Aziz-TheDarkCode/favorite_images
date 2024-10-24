import 'package:flutter/material.dart';
import 'dart:io';

class DetailScreen extends StatelessWidget {
  final String imagePath;
  final int index;

  const DetailScreen({
    required this.imagePath,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GalleryGo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: Center(
        child: Hero(
          tag: "image_$index", // Matching tag from the grid item
          child: InteractiveViewer(
              child: Image.file(
            File(imagePath),
            fit: BoxFit.contain,
          )),
        ),
      ),
    );
  }
}
