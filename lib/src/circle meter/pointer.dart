import 'package:flutter/material.dart';

class Pointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: GaugePainter(),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2.0, size.height / 2.0);

    Path path = Path()
      ..moveTo(center.dx - 15, center.dy)
      ..lineTo(center.dx, 0.0)
      ..lineTo(center.dx + 15, center.dy)
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 2
        ..color = Colors.orange,
    );

    canvas.drawCircle(
      center,
      size.width / 6,
      Paint()..color = Colors.orange,
    );
  }

  @override
  bool shouldRepaint(GaugePainter oldDelegate) => false;
}
