import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/firebase_servives/send_profile_image_name_controller.dart';

import '../presentation/ui/screens/auth/log_in_screen.dart';
import '../presentation/ui/utility/show_snackbar.dart';

class CreateAccountController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(
      String email, String password, File imageFile, String name) async {
    _inProgress = true;
    update();
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.find<SendProfileImageNameController>()
          .uploadProfilePicAndName(imageFile, name);
      showSnackbar("Signup is successfully completed! please login.");
      Get.offAll(() => const LogInScreen());
      _inProgress = false;
      update();
    }).onError((error, stackTrace) {
      showSnackbar(error.toString(), error: true);
      _inProgress = false;
      update();
    });
  }
}
