import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor/models/text_model.dart';
import 'package:image_editor/utils/utils.dart';

class EditProvider extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  TextModel? _selectedText;
  TextModel? get selectedText => _selectedText;

  // A function to select an image from the Gallery

  void selectImage(context) async {
    _image = await pickImage(context);
    notifyListeners();
  }

  // A callback function that notifies the provider which text is being clicked

  void setSelectedText(TextModel textModel) {
    _selectedText = textModel;
    notifyListeners();
  }
}
