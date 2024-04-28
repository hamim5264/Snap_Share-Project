import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_share/presentation/ui/utility/app_colors.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                  "First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter First Name",
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter Last Name",
                  ),
                  textInputAction: TextInputAction.next,
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
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
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
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text("Upload Your Photo",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15))),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: CircleAvatar(
                      radius: 35,
                      child: _image == null
                          ? const Text('No image selected.')
                          : Image.file(
                              File(
                                _image!.path,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Create Account",
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
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
