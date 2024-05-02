import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:snap_share/controller_binder.dart';
import 'package:snap_share/presentation/ui/screens/auth/splash_screen.dart';
import 'package:snap_share/presentation/ui/utility/app_theme_data.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
      initialBinding: ControllerBinder(),
    );
  }
}
