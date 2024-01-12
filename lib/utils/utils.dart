import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_editor/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    var status = await Permission.photos.request();
    if (status.isGranted) {
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
  return image;
}
