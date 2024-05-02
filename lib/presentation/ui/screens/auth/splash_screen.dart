import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:snap_share/firebase_servives/auth_controller.dart';
import 'package:snap_share/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:snap_share/presentation/ui/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //moveToNextScreen();
    Get.find<AuthController>().isLogin;
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text(
              "Developed by Team Green - Ostad Pro Batch",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
