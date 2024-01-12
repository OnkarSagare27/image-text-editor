import 'package:flutter/material.dart';

class TextModel {
  final Pos pos;
  final String content;
  final TextStyle style;

  TextModel({
    required this.pos,
    required this.content,
    required this.style,
  });
}

class Pos {
  final double x;
  final double y;

  Pos({
    required this.x,
    required this.y,
  });
}
