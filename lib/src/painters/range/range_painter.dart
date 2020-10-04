import 'package:flutter/material.dart';
import 'package:im_util/im_util.dart';

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
    ImaginaryArc imaginaryArc1 = ImaginaryArc(
      center: size.center(Offset(0.0, 0.0)),
      width: size.width - 20,
      height: size.height - 20,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
      numberOfPoints: points,
    );

    for (int i = 0; i < imaginaryArc1.coordinates.length; i++) {
      TextPainter tp = TextPainter(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        text: TextSpan(
          text: '${i * rangeMultiplier}',
          style: textStyle,
        ),
      );

      tp.layout();
      tp.paint(
        canvas,
        imaginaryArc1.coordinates[i].toOffset.translate(-5, -8),
      );
    }
  }

  @override
  bool shouldRepaint(RangePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RangePainter oldDelegate) => false;
}
