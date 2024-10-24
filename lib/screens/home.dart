import 'package:favorite_images/_widgets/layouts/custom_app_bar.dart';
import 'package:favorite_images/screens/detailed_view.dart';
import 'package:flutter/material.dart';
import 'package:favorite_images/services/image_picker_service.dart';
import "dart:io";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void refreshGallery() {
    setState(() {
      print("Refreshed");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        refresher: refreshGallery,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Photos, Your Story, All in One Place!",
                style: TextStyle(fontSize: 18)),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: ImagePickerService.gallery.isEmpty
                  ? const Center(
                      child: Text(
                        "No photos yet! Tap the camera icon to take a picture or browse your library!",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Number of columns
                        childAspectRatio: 1, // Aspect ratio of each item
                        crossAxisSpacing: 8, // Spacing between columns
                        mainAxisSpacing: 8, // Spacing between rows
                      ),
                      itemCount: ImagePickerService.gallery
                          .length, // Assuming this returns the list directly
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                        imagePath:
                                            ImagePickerService.gallery[index],
                                        index: index)))
                          },
                          child: Hero(
                              tag: "image_$index",
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  File(ImagePickerService.gallery[index]),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


// child: ,
