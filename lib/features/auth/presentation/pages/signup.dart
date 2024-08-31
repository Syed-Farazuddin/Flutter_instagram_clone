import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/colors.dart';
import 'package:instagram_clone/features/auth/data/repository/auth_repository_imp.dart';
import 'package:instagram_clone/features/auth/presentation/pages/Login.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_button.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:instagram_clone/utils/select_image.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Move variables to the class level to maintain state
  Uint8List? img;
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController bio = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    username.dispose();
    password.dispose();
    email.dispose();
    bio.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      img = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                "lib/assets/images/ic_instagram.svg",
                color: primaryColor,
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  debugPrint("Add a new photo");
                  selectImage();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: img != null
                          ? MemoryImage(img!)
                          : const NetworkImage(
                              "https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg=",
                            ) as ImageProvider,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        icon: const Icon(Icons.add_a_photo),
                        onPressed: () {
                          selectImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CustomInputField(
                title: "Enter your Email Address",
                controller: email,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                title: "Enter your User Name",
                controller: username,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                title: "Enter your password",
                obscureText: true,
                controller: password,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                title: "Enter your Bio",
                controller: bio,
              ),
              const SizedBox(height: 30),
              CustomButton(
                title: "Sign up",
                onPressed: () {
                  print(
                      '${email.text} ${password.text} ${username.text} ${bio.text}');
                  AuthRepositoryImp().signUp(
                    email: email.text,
                    password: password.text,
                    photo: img ?? Uint8List(10), // Use img here
                    username: username.text,
                    bio: bio.text,
                  );
                },
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
