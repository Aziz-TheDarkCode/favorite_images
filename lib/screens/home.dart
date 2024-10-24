import 'package:favorite_images/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GalleryGo",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
              onPressed: () => {ImagePickerService.getImageFromGallery()},
              icon: const Icon(LucideIcons.imagePlus)),
          IconButton(
              onPressed: () => {ImagePickerService.getImageFromCamera()},
              icon: const Icon(LucideIcons.camera)),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Photos, Your Story, All in One Place!",
                style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 32,
            ),
            Expanded(
                child: SizedBox(
              height: double.infinity,
              child: Center(
                child: Text(
                  'No photos yet! Tap the camera icon to take a picture or browse your library',
                  textAlign: TextAlign.center,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
// child: ,