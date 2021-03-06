import 'package:flutter/material.dart';
import 'package:im_util/im_util.dart';

class PointerPainter extends CustomPainter {
  final int pointTo;
  final double startAngle;
  final double sweepAngle;
  final int points;
  final PointerDecoration decoration;
  Paint _brush;

  PointerPainter({
    this.pointTo = 0,
    this.startAngle = 120,
    this.sweepAngle = 300,
    this.points = 10,
    this.decoration = const PointerDecoration(),
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset(0.0, 0.0));

    _brush = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.width
      ..strokeCap = decoration.style;

    ImaginaryArc imaginaryArc = ImaginaryArc(
      center: center,
      numberOfPoints: points,
      width: size.width - 50,
      height: size.height - 50,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    canvas.drawLine(
      center,
      imaginaryArc.coordinates[pointTo].toOffset,
      _brush,
    );

    canvas.drawCircle(
      Offset(center.dx, center.dy),
      3 * _brush.strokeWidth,
      _brush..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(PointerPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PointerPainter oldDelegate) => false;
}

class PointerDecoration {
  final Color color;
  final double width;
  final StrokeCap style;

  const PointerDecoration({
    this.color = Colors.black,
    this.width = 1,
    this.style = StrokeCap.round,
  });
}
