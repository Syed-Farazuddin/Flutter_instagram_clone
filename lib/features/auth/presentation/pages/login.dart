import 'package:flutter/material.dart';
import 'package:instagram_clone/core/colors.dart';
import 'package:instagram_clone/features/auth/presentation/pages/signup.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = new TextEditingController();
    TextEditingController password = new TextEditingController();
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
              _myInputField("User Name", context, false, username),
              const SizedBox(
                height: 30,
              ),
              _myInputField("Password", context, true, password),
              const SizedBox(
                height: 30,
              ),
              _myButton("Login", () {}),
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

Widget _myButton(String title, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: blueColor,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget _myInputField(
  String? title,
  context,
  bool obscureText,
  TextEditingController controller,
) {
  OutlineInputBorder border =
      OutlineInputBorder(borderSide: Divider.createBorderSide(context));
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: title,
      enabledBorder: border,
      filled: true,
      border: border,
      contentPadding: const EdgeInsets.all(8),
    ),
    obscureText: obscureText,
  );
}
