import 'package:flutter/material.dart';
import 'package:im_util/im_util.dart';

class DialPainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final int points;
  final bool showLines;
  final DialDecoration decoration;
  final bool isFilled;
  final double tickLength;
  Paint _brush;

  DialPainter({
    this.startAngle = 0.0,
    this.sweepAngle = 360.0,
    this.points = 40,
    this.showLines = false,
    this.decoration = const DialDecoration(),
    this.isFilled = false,
    this.tickLength = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _brush = Paint()
      ..color = decoration.color
      ..strokeWidth = decoration.width
      ..strokeCap = StrokeCap.round
      ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke;

    Offset center = size.center(Offset(0.0, 0.0));

    // Draw the enclosing path.
    canvas.drawArc(
      Rect.fromCenter(center: center, width: size.width, height: size.width),
      toRadians(startAngle),
      toRadians(sweepAngle),
      false,
      _brush,
    );

    // To create the ticks, first the outer path (arc / circle) offsets are generated and than the inner path offsets. Finally, both are joined to create the ticks.

    // Get outer path offsets.
    ImaginaryArc imaginaryArc1 = ImaginaryArc(
      center: center,
      numberOfPoints: points,
      width: size.width,
      height: size.height,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    // Get inner path offsets
    ImaginaryArc imaginaryArc2 = ImaginaryArc(
      center: center,
      numberOfPoints: points,
      width: size.width - tickLength,
      height: size.height - tickLength,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    // Draw lines from outer offsets to inner offsets to draw the tick marks.
    for (int i = 0; i < imaginaryArc1.coordinates.length; i++) {
      canvas.drawLine(
        imaginaryArc1.coordinates[i].toOffset,
        imaginaryArc2.coordinates[i].toOffset,
        _brush,
      );
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

  const DialDecoration({this.color = Colors.black, this.width = 1.0});
}
