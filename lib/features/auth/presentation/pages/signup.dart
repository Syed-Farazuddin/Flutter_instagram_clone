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
              SvgPicture.asset("lib/assets/images/ic_instagram.svg"),
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
