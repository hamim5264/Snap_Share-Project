

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:snap_share/presentation/ui/screens/auth/verify_log_in_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Home Page",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: const Center(
        child:  Text("Home Page Screen"),
      ),
    );
  }
  logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(()=>const VerifyLogInScreen());
  }

}
