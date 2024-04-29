
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  XFile? _image;

  XFile? get image => _image;
  final _picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path,);
      update();
    }
  }

  Future <void> nullImage() async{
    _image = null;
    update();
  }
}