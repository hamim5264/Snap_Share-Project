import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/presentation/ui/utility/auth_helper.dart';
import 'package:snap_share/presentation/ui/utility/show_snackbar.dart';

import '../presentation/ui/screens/auth/home_screen.dart';

class UserLoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future userLogin(String email, String password, BuildContext context) async {
    if (email == null.toString() || password == null.toString()) {
      showSnackbar("Enter Required Field", error: true);
    } else {
      AuthHelper.customProgressBar(context);
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) => Get.offAll(() => const HomeScreen()));
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        update();
        Timer(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Center(
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: SizedBox(
                height: 10,
                width: 10,
                child: AuthHelper.showDialogue(
                    context, "User Not Found", DialogType.error,
                    btnOkColor: Colors.blueAccent.shade200,
                    descriotion: e.code.toString()),
              ),
            ),
          );
        });
      }
    }
  }
}
