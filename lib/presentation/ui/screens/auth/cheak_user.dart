

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snap_share/presentation/ui/screens/auth/splash_screen.dart';
import 'package:snap_share/presentation/ui/screens/auth/verify_log_in_screen.dart';


import 'home_screen.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
  checkUser(){
    final user=  FirebaseAuth.instance.currentUser;
    if(user!=null){
      return const HomeScreen();

    }else{
      return const SplashScreen();
    }
  }
}
