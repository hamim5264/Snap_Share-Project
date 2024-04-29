
import 'package:flutter/material.dart';
import 'package:snap_share/app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCr7CJf0lNgsCZsdQmFWexJ-kezlqfM2TU",
          appId: "1:76892939231:android:3585d0ceadff7111f09a6a",
          messagingSenderId: "76892939231",
          projectId: "snap-share-team-green",
          storageBucket: 'snap-share-team-green.appspot.com'
      ));

  runApp(const SnapShare());
}
