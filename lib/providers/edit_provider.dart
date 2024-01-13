import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_editor/models/text_model.dart';
import 'package:image_editor/utils/utils.dart';
import 'package:image_editor/widgets/custom_outlined_font_button.dart';
import 'package:image_editor/widgets/snackbar.dart';

class EditProvider extends ChangeNotifier {
  File? _image;
  File? get image => _image;

  TextModel? _selectedText;
  TextModel? get selectedText => _selectedText;

  List<Widget> _textStack = [];
  List<Widget> get textStack => _textStack;

  String? selectedFontFamily = GoogleFonts.poppins().fontFamily;

  // final List<Widget> _fontButtons = [
  //   OutlinedButton(
  //     onPressed: () => setSelectedFont(fontFamily),
  //     style: OutlinedButton.styleFrom(
  //       side: const BorderSide(color: Colors.deepPurple),
  //       backgroundColor: Colors.deepPurple.withOpacity(0.2),
  //       shape: const CircleBorder(),
  //     ),
  //     child: Text(
  //       'Aa',
  //       style: TextStyle(
  //         color: Colors.deepPurple,
  //         fontFamily: GoogleFonts.poppins().fontFamily,
  //       ),
  //     ),
  //   ),
  //   CustomOutlinedFontButton(fontFamily: GoogleFonts.sacramento().fontFamily, onPressed: () => setSelectedFont(GoogleFonts.sacramento().fontFamily), selectedFontFamily: selectedFontFamily)
  // ];

  void setSelectedFont(String? fontFamily) {
    selectedFontFamily = fontFamily;
    notifyListeners();
  }

  // A function to select an image from the Gallery

  void selectImage(context) async {
    _image = await pickImage(context);
    if (_image != null) {
      _textStack.add(
        Image.file(
          _image!,
          fit: BoxFit.contain,
        ),
      );
    } else {
      showSnackBar(context, 'No image selected');
    }
    notifyListeners();
  }

  // A callback function that notifies the provider which text is being clicked

  void setSelectedText(TextModel textModel) {
    _selectedText = textModel;
    notifyListeners();
  }

  Future<void> showDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextField(
            onChanged: (value) => {print(value)},
          ),
          content: Column(
            children: [
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () =>
                        setSelectedFont(GoogleFonts.poppins().fontFamily),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: selectedFontFamily ==
                                  GoogleFonts.poppins().fontFamily
                              ? Colors.deepPurple
                              : Colors.black),
                      backgroundColor:
                          selectedFontFamily == GoogleFonts.poppins().fontFamily
                              ? Colors.deepPurple.withOpacity(0.2)
                              : Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: Text(
                      'Aa',
                      style: TextStyle(
                        color: selectedFontFamily ==
                                GoogleFonts.poppins().fontFamily
                            ? Colors.deepPurple
                            : Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () =>
                        setSelectedFont(GoogleFonts.sansita().fontFamily),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: selectedFontFamily ==
                                  GoogleFonts.sansita().fontFamily
                              ? Colors.deepPurple
                              : Colors.black),
                      backgroundColor:
                          selectedFontFamily == GoogleFonts.sansita().fontFamily
                              ? Colors.deepPurple.withOpacity(0.2)
                              : Colors.white,
                      shape: const CircleBorder(),
                    ),
                    child: Text(
                      'Aa',
                      style: TextStyle(
                        color: selectedFontFamily ==
                                GoogleFonts.sansita().fontFamily
                            ? Colors.deepPurple
                            : Colors.black,
                        fontFamily: GoogleFonts.sansita().fontFamily,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
            // Add more buttons if needed
          ],
        );
      },
    );
  }
}
