import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSelector extends StatefulWidget {
  const FontSelector({super.key, required this.onSelect});
  final void Function(String?) onSelect;

  @override
  State<FontSelector> createState() => _FontSelectorState();
}

class _FontSelectorState extends State<FontSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () => setState(() {
            widget.onSelect(GoogleFonts.poppins().fontFamily);
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
        )
      ],
    );
  }
}
