import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_share/firebase_servives/create_account_controller.dart';
import 'package:snap_share/presentation/ui/utility/app_colors.dart';
import '../../../state_holder/picke_image_controller.dart';
import '../../utility/show_snackbar.dart';
import '../../widgets/center_circular_progress_indicator.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _fullNameTEController = TextEditingController();
  final _emailTEController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<PickImageController>().nullImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    "Let's Create Your Account",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: _fullNameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: "Enter Full Name",
                    ),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter full name";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                    ),
                    validator: (value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter e-mail";
                      } else if (RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return null;
                      }
                      return "invalid E-mail";
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter password";
                      }
                      if (value!.length < 8) {
                        return "Enter password more then 8 digit";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text("Upload Your Photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15))),
                  Center(
                    child: GetBuilder<PickImageController>(
                        builder: (pickImageController) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: CircleAvatar(
                          radius: 40,
                          child: pickImageController.image == null
                              ? const Text('No image selected.')
                              : Image.file(
                                  File(
                                    pickImageController.image!.path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<CreateAccountController>(
                      builder: (createAccountController) {
                        return Visibility(
                          visible: createAccountController.inProgress==false,
                          replacement: const CenterCircularProgressIndicator(),
                          child: ElevatedButton(
                            onPressed: createAccount,
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<PickImageController>().getImageFromGallery();
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    if (Get.find<PickImageController>().image != null) {
      if (_formKey.currentState!.validate()) {
        Get.find<CreateAccountController>().createAccount(
            _emailTEController.text.trim(),
            _passwordController.text,
            File(Get.find<PickImageController>().image!.path),
            _fullNameTEController.text.trim());
      }
    } else {
      showSnackbar("Please select profile picture!", error: true);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameTEController.dispose();
    _emailTEController.dispose();
    _passwordController.dispose();
  }
}

