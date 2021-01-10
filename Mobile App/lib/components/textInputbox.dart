import 'package:flutter/material.dart';

class TextInputBox extends StatefulWidget {
  final String text;
  final double radius;
  TextInputBox({this.text, this.radius});
  @override
  _TextInputBoxState createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value);
      },
      keyboardType: widget.text == 'Description'
          ? TextInputType.multiline
          : TextInputType.text,
      maxLines: widget.text == 'Description' ? null : 1,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: widget.text,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Color(0xff6B6060).withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius),
        ),
      ),
    );
  }
}
