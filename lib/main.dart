
import 'package:flutter/material.dart';
import 'package:snap_share/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAC4h2hA-WNUDp-fJ4VBxnGDrsRPSz6xOM",
          appId: "1:462270560622:android:53dc6818effe2e62a4697f",
          messagingSenderId: "462270560622",
          projectId: "snap-share-e40ef",
          storageBucket: 'snap-share-e40ef.appspot.com'
      ));

  runApp(const SnapShare());
}