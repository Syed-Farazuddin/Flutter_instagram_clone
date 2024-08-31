import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/core/colors.dart';
import 'package:instagram_clone/features/auth/presentation/pages/Login.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_button.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    @override
    void dispose() {
      super.dispose();
      username.dispose();
      password.dispose();
      email.dispose();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextField(),

              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                "lib/assets/images/ic_instagram.svg",
                color: primaryColor,
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    child: Image.network(
                      "https://media.istockphoto.com/id/1332100919/vector/man-icon-black-icon-person-symbol.jpg?s=612x612&w=0&k=20&c=AVVJkvxQQCuBhawHrUhDRTCeNQ3Jgt0K1tXjJsFy1eg=",
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CustomInputField(
                title: "Enter your Email Address",
                controller: email,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomInputField(
                title: "Enter your User Name",
                controller: username,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomInputField(
                title: "Enter your password",
                obscureText: true,
                controller: password,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomInputField(
                title: "Enter your Bio",
                controller: username,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(title: "Sign up", onPressed: () {}),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ? ",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (conetext) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign in ",
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
