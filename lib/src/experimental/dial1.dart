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

    ImaginaryArc a1 = ImaginaryArc(
      center: center,
      width: size.width,
      height: size.height,
      numberOfPoints: dataPoints,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    ImaginaryArc a2 = ImaginaryArc(
      center: center,
      width: size.width - 15,
      height: size.height - 15,
      numberOfPoints: dataPoints,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    for (int i = 0; i < a1.offsets.length; i++) {
      canvas.drawArc(
        Rect.fromCenter(center: a1.offsets[i], width: 10, height: 10),
        toRadians(0),
        toRadians(360),
        false,
        _brush
          ..style = PaintingStyle.fill
          ..color = Colors.orange,
      );

      canvas.drawLine(
        a1.offsets[i],
        a2.offsets[i],
        _brush,
      );
    }
  }

  @override
  bool shouldRepaint(Dial1 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(Dial1 oldDelegate) => false;
}
