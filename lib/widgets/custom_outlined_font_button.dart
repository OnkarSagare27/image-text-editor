import 'package:flutter/material.dart';

class CustomOutlinedFontButton extends StatefulWidget {
  const CustomOutlinedFontButton({
    super.key,
    required this.fontFamily,
    required this.onPressed,
    required this.selectedFontFamily,
  });
  final String? fontFamily;
  final String? selectedFontFamily;
  final void Function()? onPressed;

  @override
  State<CustomOutlinedFontButton> createState() =>
      _CustomOutlinedFontButtonState();
}

class _CustomOutlinedFontButtonState extends State<CustomOutlinedFontButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => setState(() {
        widget.onPressed;
      }),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            color: widget.selectedFontFamily == widget.fontFamily
                ? Colors.deepPurple
                : Colors.black),
        backgroundColor: widget.selectedFontFamily == widget.fontFamily
            ? Colors.deepPurple.withOpacity(0.2)
            : Colors.white,
        shape: const CircleBorder(),
      ),
      child: Text(
        'Aa',
        style: TextStyle(
          color: widget.selectedFontFamily == widget.fontFamily
              ? Colors.deepPurple
              : Colors.black,
          fontFamily: widget.fontFamily,
        ),
      ),
    );
  }
}
