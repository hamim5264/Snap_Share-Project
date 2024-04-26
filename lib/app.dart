import 'package:flutter/material.dart';
import 'package:snap_share/presentation/ui/screens/auth/splash_screen.dart';
import 'package:snap_share/presentation/ui/utility/app_theme_data.dart';

class SnapShare extends StatelessWidget {
  const SnapShare({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightThemeData,
      home: const SplashScreen(),
    );
  }
}
