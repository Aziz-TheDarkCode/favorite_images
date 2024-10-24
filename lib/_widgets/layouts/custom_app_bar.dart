import 'package:favorite_images/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback refresher;
  const CustomAppBar({super.key, required this.refresher});

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Specify the preferred size
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "GalleryGo",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      actions: [
        IconButton(
            onPressed: () async {
              XFile? image = await ImagePickerService.getImageFromGallery();
              ImagePickerService.addToGallery(image);
              widget.refresher();
            },
            icon: const Icon(LucideIcons.imagePlus)),
        IconButton(
            onPressed: () async {
              XFile? image = await ImagePickerService.getImageFromCamera();
              ImagePickerService.addToGallery(image);
              widget.refresher();
            },
            icon: const Icon(LucideIcons.camera)),
      ],
    );
  }
}
