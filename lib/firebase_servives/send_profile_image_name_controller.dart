import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

import '../presentation/ui/utility/show_snackbar.dart';

class SendProfileImageNameController extends GetxController {
  String _imageUrl = '';

  final profileRef = FirebaseFirestore.instance.collection('UserProfile');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadProfilePicAndName(imageFile, name) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    firebase_storage.Reference ref = storage.ref(
        '/profilePic/${FirebaseAuth.instance.currentUser!.uid.toString()}');
    firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    await Future.value(uploadTask).then((value) async {
      _imageUrl = await ref.getDownloadURL();
      update();
      profileRef
          .doc(id)
          .set({'profileImage': _imageUrl, 'profileName': name})
          .then((value) {})
          .onError((error, stackTrace) {
            showSnackbar(error.toString(), error: true);
          });
    });
  }
}
