import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor/utils/utils.dart';

class EditProvider extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  // A function to select an image from the Gallery

  void selectImage(context) async {
    _image = await pickImage(context);
    notifyListeners();
  }
}
