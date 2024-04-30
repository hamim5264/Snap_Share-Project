import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:snap_share/firebase_servives/user_login_controller.dart';
import 'package:snap_share/presentation/ui/utility/auth_helper.dart';

import '../../utility/show_snackbar.dart';

class VerifyLogInScreen extends StatefulWidget {
  const VerifyLogInScreen({super.key});

  @override
  State<VerifyLogInScreen> createState() => _VerifyLogInScreenState();
}

class _VerifyLogInScreenState extends State<VerifyLogInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _passwordHiddenTEController = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                    height: 100,
                  ),
                  const Text(
                    "Enter Your Phone/Email and Password",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,

                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
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
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: "Input Email/Phone",
                      prefixIcon: Icon(
                        Icons.mail_outline_outlined,
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
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
                    controller: _passwordTEController,
                    obscureText: !_passwordHiddenTEController,
                    decoration: InputDecoration(
                      hintText: "Input Password",
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordHiddenTEController
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordHiddenTEController =
                                !_passwordHiddenTEController;
                          });
                        },
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const ListTile(
                    title: Text(
                      "Save Password",
                    ),
                    leading: Icon(
                      Icons.check_box_outline_blank,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        userLogin();
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin() async {
    if (_formKey.currentState!.validate()) {
      Get.find<UserLoginController>().userLogin(
          _emailTEController.text.trim(), _passwordTEController.text,context);
    } else {
      showSnackbar("Something went Wrong!", error: true);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
