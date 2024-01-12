import 'package:flutter/material.dart';

class DraggableTextWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Offset initialPosition;

  DraggableTextWidget({
    required this.text,
    required this.textStyle,
    required this.initialPosition,
  });

  @override
  _DraggableTextWidgetState createState() => _DraggableTextWidgetState();
}

class _DraggableTextWidgetState extends State<DraggableTextWidget> {
  late Offset _position;

  @override
  void initState() {
    super.initState();
    _position = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _position.dx,
      top: _position.dy,
      child: Draggable(
        child: Text(
          widget.text,
          style: widget.textStyle,
        ),
        feedback: Text(
          widget.text,
          style: widget.textStyle,
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            _position = offset;
          });
        },
      ),
    );
  }
}
