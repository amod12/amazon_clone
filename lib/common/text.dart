import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxlines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white12,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black54,
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
      
      validator: (val) {
        if (val == null|| val.isEmpty){
          return 'Enter your $hintText';
        }
        return null;
      },
      
      maxLines: maxlines,
    );
  }
}
