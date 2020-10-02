import 'package:flutter/material.dart';
import 'package:im_shapes/im_shapes.dart';

import '../../util.dart';

class DialPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final int points;
  final bool showLines;
  final DialDecoration decoration;
  final bool isFilled;
  Paint _brush;

  DialPainter({
    this.startAngle = 0.0,
    this.sweepAngle = 360.0,
    this.points = 0,
    this.showLines = false,
    this.decoration,
    this.isFilled = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _brush = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.width
      ..strokeCap = StrokeCap.round
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke;

    drawCircle(
      canvas: canvas,
      radius: size.width,
      center: size.center(Offset(0.0, 0.0)),
      startAngle: toRadians(startAngle),
      sweepAngle: toRadians(sweepAngle),
      brush: _brush,
      useCenter: false,
    );

    if (showLines) {
      List<Offset> coordinates = pointsCoordinatesOnArc(
        center: size.center(Offset(0.0, 0.0)),
        radius: size.width,
        startAngle: startAngle,
        sweepAngle: sweepAngle,
        points: points,
      );

      for (int i = 0; i < coordinates.length; i++) {
        canvas.drawLine(
          size.center(Offset(0.0, 0.0)),
          Offset(coordinates[i].dx, coordinates[i].dy),
          _brush,
        );
      }
    }
  }

  @override
  bool shouldRepaint(DialPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DialPainter oldDelegate) => false;
}

class DialDecoration {
  final Color color;
  final double width;

  const DialDecoration({this.color = Colors.black, this.width = 1});
}
