import 'package:flutter/material.dart';

import '../../util.dart';

class RangePainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final int points;
  final int rangeMultiplier;
  final TextStyle textStyle;

  RangePainter({
    this.startAngle = 120,
    this.sweepAngle = 300,
    this.points = 10,
    this.rangeMultiplier = 1,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
  });

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> coordinates = pointsCoordinatesOnArc(
      center: size.center(Offset(0.0, 0.0)),
      radius: size.width - 20,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      points: points,
    );

    for (int i = 0; i < coordinates.length; i++) {
      TextPainter tp = TextPainter(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '${i * rangeMultiplier}',
          style: textStyle,
        ),
      );

      tp.layout();
      tp.paint(canvas, Offset(coordinates[i].dx - 5, coordinates[i].dy - 8));
    }
  }

  @override
  bool shouldRepaint(RangePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RangePainter oldDelegate) => false;
}
