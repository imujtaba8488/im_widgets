import 'package:flutter/material.dart';
import 'package:im_util/im_util.dart';

class Dial1 extends CustomPainter {
  double startAngle;
  double sweepAngle;
  Paint _brush;
  int dataPoints;

  Dial1({
    this.startAngle = 0,
    this.sweepAngle = 360,
    this.dataPoints = 150,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _brush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
    Offset center = size.center(Offset(0.0, 0.0));

    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width, height: size.width),
      startAngle,
      sweepAngle,
      false,
      _brush
        ..style = PaintingStyle.fill
        ..color = Colors.purple,
    );

    List<Offset> p1 = pointsOffsetsOnArc(
      center: center,
      radius: size.width,
      numberOfPoints: dataPoints,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    List<Offset> p2 = pointsOffsetsOnArc(
      center: center,
      radius: size.width - 15,
      numberOfPoints: dataPoints,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    for (int i = 0; i < p1.length; i++) {

      canvas.drawArc(
        Rect.fromCenter(center: p1[i], width: 10, height: 10),
        toRadians(0),
        toRadians(360),
        false,
        _brush
          ..style = PaintingStyle.fill
          ..color = Colors.orange,
      );

      canvas.drawLine(
        p1[i],
        p2[i],
        _brush,
      );
    }
  }

  @override
  bool shouldRepaint(Dial1 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Dial1 oldDelegate) => false;
}
