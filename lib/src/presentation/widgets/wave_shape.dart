import 'package:flutter/material.dart';

class WaveShapeBuilder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.9990500);
    path0.lineTo(size.width * 0.1786500, size.height * 0.8912500);
    path0.lineTo(size.width * 0.2674000, size.height * 0.7381500);
    path0.lineTo(size.width * 0.4267000, size.height * 0.6541000);
    path0.lineTo(size.width * 0.4787000, size.height * 0.5531000);
    path0.lineTo(size.width * 0.5973500, size.height * 0.4645500);
    path0.lineTo(size.width * 0.7521000, size.height * 0.4124500);
    path0.lineTo(size.width * 0.8900000, size.height * 0.3777500);
    path0.lineTo(size.width * 0.9981500, size.height * 0.2431500);
    path0.lineTo(size.width * 0.9950000, size.height * 0.9950000);
    path0.lineTo(0, size.height * 0.9990500);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
