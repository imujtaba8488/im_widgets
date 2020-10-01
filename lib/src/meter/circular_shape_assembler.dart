import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:im_shapes/im_shapes.dart';

import '../util.dart';

class CircularShapeAssembler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 58,
      maxWidth: 58,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: DialPainter(),
              size: Size(
                constraints.maxWidth,
                constraints.maxWidth,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0;

    Offset center = size.center(Offset(0.0, 0.0));

    drawCircle(
      canvas: canvas,
      radius: size.width,
      center: center,
      startAngle: toRadians(120),
      sweepAngle: toRadians(300),
    );

    List<Point<double>> pointsCoords = pointsCoordinatesOnArc(
      center: center,
      radius: size.width,
      startAngle: 120,
      sweepAngle: 300,
      points: 2,
    );

    Path path = Path()..moveTo(pointsCoords[0].x, pointsCoords[0].y);

    for (int i = 1; i < pointsCoords.length; i++) {
      // canvas.drawCircle(
      //   Offset(pointsCoords[i].x, pointsCoords[i].y),
      //   2.5,
      //   brush
      //     ..style = PaintingStyle.fill
      //     ..color = Colors.blue,
      // );

      path.lineTo(pointsCoords[i].x, pointsCoords[i].y);

      // canvas.drawLine(
      //   Offset(pointsCoords[i].x, pointsCoords[i].y),
      //   Offset(pointsCoords[i].x, pointsCoords[i].y),
      //   brush,
      // );
    }

    canvas.drawPath(path, brush..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(DialPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DialPainter oldDelegate) => false;
}
