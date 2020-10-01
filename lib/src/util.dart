import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:im_shapes/im_shapes.dart';

List<Point<double>> pointsCoordinatesOnArc({
  @required Offset center,
  @required double radius,
  @required double startAngle,
  @required double sweepAngle,
  @required int points,
}) {
  assert(
    startAngle >= 0.0 && startAngle <= 360.0,
    'The value of startAngle be from 0.0 to 360.0',
  );

  assert(
    sweepAngle >= 0.0 && sweepAngle <= 360.0,
    'The value of sweepAngle must be from 0.0 to 360.0',
  );

  assert(points >= 0, 'The value of points must be greater than or equal to 0');

  assert(radius > 0.0, 'The value of radius must be greater than 0');

  // Distance in angle between the endAngle and the startAngle.
  // double gapAngle = 360 - sweepAngle;

  List<Point<double>> coords = [];

  // This one is manual, since the moveAngle is always going to start past the startAngle.
  coords.add(
    singleCoordinate(
      center: center,
      radius: radius,
      sweepAngle: toRadians(startAngle),
    ),
  );

  // Distance in angle between each coordinate.
  final double divisionAngle = toRadians(sweepAngle / points);

  // Determines how points should be placed along the arc and how their coordinates should be calculated.
  double moveAngle = toRadians(startAngle) + divisionAngle;

  for (int i = 0; i < points; i++) {
    coords.add(
      singleCoordinate(
        center: center,
        radius: radius,
        sweepAngle: moveAngle,
      ),
    );

    // To moveAngle add the divisionAngle i.e. the distance in angle between each coordinate.
    moveAngle += divisionAngle;
  }

  return coords;
}

Point<double> singleCoordinate({
  Offset center,
  double radius,
  double sweepAngle,
}) {
  double xCoord = center.dx + (radius - center.dx) * cos(sweepAngle);
  double yCoord = center.dy + (radius - center.dy) * sin(sweepAngle);

  return Point(xCoord, yCoord);
}

void drawCircle({
  @required Canvas canvas,
  @required Offset center,
  @required double radius,
  @required double startAngle,
  @required double sweepAngle,
}) {
  assert(startAngle >= 0 && sweepAngle <= 360);

  canvas.drawArc(
    Rect.fromCenter(center: center, width: radius, height: radius),
    startAngle,
    sweepAngle,
    false,
    Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0,
  );
}

double arcLength(double sweepAngle, double radius) {
  return sweepAngle / toRadians(360) * 2 * pi * radius;
}
