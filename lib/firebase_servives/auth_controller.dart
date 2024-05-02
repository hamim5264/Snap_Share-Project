import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snap_share/presentation/ui/screens/auth/home_screen.dart';
import 'package:snap_share/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:snap_share/presentation/ui/utility/show_snackbar.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  void get isLogin {
    final user = _auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 1),
          () => Get.offAll(() => const HomeScreen()));
    } else {
      Timer(const Duration(seconds: 1),
          () => Get.offAll(() => const LogInScreen()));
    }
  }

  void get isLogOut {
    _auth.signOut().then((value) {
      Get.offAll(() => const LogInScreen());
    }).onError((error, stackTrace) {
      showSnackbar(error.toString(), error: true);
    });
  }
}
