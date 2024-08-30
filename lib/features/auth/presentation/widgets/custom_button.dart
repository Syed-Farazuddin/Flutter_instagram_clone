import 'package:flutter/material.dart';
import 'package:instagram_clone/core/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
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
}
