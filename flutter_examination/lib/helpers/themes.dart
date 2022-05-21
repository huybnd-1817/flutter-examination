import 'package:flutter/material.dart';

//================================================================================
// Colors
//================================================================================

Color activeCheckBoxColor = const Color.fromRGBO(244, 129, 73, 1);

//================================================================================
// Text Styles
//================================================================================

TextStyle hintTextStyle = const TextStyle(
    fontSize: 18, fontWeight: FontWeight.w300, color: Colors.white);

//================================================================================
// Input Border Styles
//================================================================================

InputBorder inputBorderStyle = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));

//================================================================================
// Button Styles
//================================================================================

ButtonStyle circleButtonStyle = ElevatedButton.styleFrom(
  shape: const CircleBorder(),
  padding: const EdgeInsets.all(16),
  primary: Colors.white,
);

ButtonStyle stadiumButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
  primary: Colors.white,
  shape: const StadiumBorder(),
);

//================================================================================
// Box Decorations
//================================================================================

BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
      Color.fromRGBO(255, 121, 68, 1),
      Color.fromRGBO(244, 50, 111, 1)
    ]));