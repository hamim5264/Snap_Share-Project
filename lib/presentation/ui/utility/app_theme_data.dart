import 'package:flutter/material.dart';
import 'package:snap_share/presentation/ui/utility/app_colors.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
      circularTrackColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold
          ),
          foregroundColor: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 5,
    ),
  );
}
