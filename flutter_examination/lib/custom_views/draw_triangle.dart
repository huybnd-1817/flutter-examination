import 'package:flutter/material.dart';

class DrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
