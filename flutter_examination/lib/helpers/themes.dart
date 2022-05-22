import 'package:flutter/material.dart';

//================================================================================
// Colors
//================================================================================

Color activeCheckBoxColor = const Color.fromRGBO(244, 129, 73, 1);

//================================================================================
// Input Border Styles
//================================================================================

InputBorder inputBorderStyle = const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));

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