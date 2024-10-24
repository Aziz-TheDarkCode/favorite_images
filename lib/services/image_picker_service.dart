import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final _imagePicker = ImagePicker();

  static Future<XFile?> getImageFromGallery() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }

  static Future<XFile?> getImageFromCamera() async {
    return await _imagePicker.pickImage(source: ImageSource.camera);
  }
}
