import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';


void showSnackbar(String message, {bool error = false}) {
  Get.showSnackbar(GetSnackBar(
    message: message,
    duration: const Duration(seconds: 3),
    isDismissible: true,
    backgroundColor: error ? Colors.red : AppColors.primaryColor,
  ));
}