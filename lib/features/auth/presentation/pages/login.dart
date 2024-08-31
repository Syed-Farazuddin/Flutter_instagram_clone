import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/core/colors.dart';
import 'package:instagram_clone/features/auth/presentation/pages/signup.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_button.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/custom_input_field.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
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
              SvgPicture.asset(
                "lib/assets/images/ic_instagram.svg",
                color: primaryColor,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomInputField(
                title: "User Name",
                controller: username,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomInputField(
                title: "Password",
                obscureText: true,
                controller: password,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(title: "Login", onPressed: () {}),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ? "),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (conetext) => const Signup(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up ",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              // Flexible(
              //   child: Container(),
              //   flex: 1,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
