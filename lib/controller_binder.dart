import 'package:get/get.dart';
import 'package:snap_share/firebase_servives/auth_controller.dart';
import 'package:snap_share/firebase_servives/user_login_controller.dart';
import 'package:snap_share/presentation/state_holder/picke_image_controller.dart';

import 'firebase_servives/create_account_controller.dart';
import 'firebase_servives/send_profile_image_name_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(PickImageController());
    Get.put(CreateAccountController());
    Get.put(SendProfileImageNameController());
    Get.put(UserLoginController());
    Get.put(AuthController());
  }
}
