import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final List<String> _gallery = [];
  static final _imagePicker = ImagePicker();

  static Future<XFile?> getImageFromGallery() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }

  static void addToGallery(XFile? image) async {
    if (image != null) {
      print("Image added successfully");
      _gallery.add(image.path);
    }
  }

  static Future<XFile?> getImageFromCamera() async {
    return await _imagePicker.pickImage(source: ImageSource.camera);
  }

  static List<String> get gallery => _gallery;
}
