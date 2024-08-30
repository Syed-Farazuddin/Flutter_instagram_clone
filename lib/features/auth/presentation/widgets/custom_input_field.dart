import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? title;
  final bool obscureText;
  final TextEditingController controller;
  const CustomInputField(
      {super.key,
      required this.controller,
      required this.title,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
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
}
