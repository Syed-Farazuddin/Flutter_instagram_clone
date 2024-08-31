import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  ImagePicker picker = new ImagePicker();
  XFile? file = await picker.pickImage(source: source);
  if (file != null) {
    return file.readAsBytes();
  }
  debugPrint("No image is selected");
}
