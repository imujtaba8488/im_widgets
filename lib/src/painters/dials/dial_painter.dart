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
    List<Offset> offsets = pointsOffsetsOnArc(
      center: center,
      numberOfPoints: points,
      radius: size.width,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    // Get inner path offsets
    List<Offset> offsets2 = pointsOffsetsOnArc(
      center: center,
      numberOfPoints: points,
      radius: size.width - tickLength,
      startAngle: startAngle,
      sweepAngle: sweepAngle,
    );

    // Draw lines from outer offsets to inner offsets to draw the tick marks.
    for (int i = 0; i < offsets.length; i++) {
      canvas.drawLine(
        offsets[i],
        Offset(offsets2[i].dx, offsets2[i].dy),
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
