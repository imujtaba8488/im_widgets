import 'package:flutter/material.dart';

import 'package:im_shapes/im_shapes.dart';

class Circle extends StatelessWidget {
  final double startAngle;
  final double sweepAngle;
  final bool isFilled;
  final Color color;
  final double borderWidth;

  Circle({
    this.startAngle = 0.0,
    this.sweepAngle = 360.0,
    this.isFilled = true,
    this.color = Colors.blue,
    this.borderWidth = 1.0,
  }) {
    assert(
      startAngle >= 0 && startAngle <= 360,
      'startAngle must be greater than or equal to 0 and must be less than or equal to 360',
    );

    assert(
      sweepAngle >= 0 && sweepAngle <= 360,
      'sweepAngle must be greater than or equal to 0 and must be less than or equal to 360',
    );
  }

  Circle.full({
    bool isFilled = true,
    Color color = Colors.blue,
    double borderWidth = 1.0,
  }) : this(
          startAngle: 0.0,
          sweepAngle: 360.0,
          isFilled: isFilled,
          color: color,
          borderWidth: borderWidth,
        );

  Circle.semiUpward({
    bool isFilled = true,
    Color color = Colors.blue,
    double borderWidth = 1.0,
  }) : this(
          startAngle: 180.0,
          sweepAngle: 180.0,
          isFilled: isFilled,
          color: color,
          borderWidth: borderWidth,
        );

  Circle.semiDownward({bool isFilled = true, Color color, double borderWidth})
      : this(
          startAngle: 0.0,
          sweepAngle: 180.0,
          isFilled: isFilled,
          color: color,
          borderWidth: borderWidth,
        );

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: CirclePainter(
                startAngle: startAngle,
                sweepAngle: sweepAngle,
                isFilled: isFilled,
                color: color,
                strokeWidth: borderWidth,
              ),
              size: Size.infinite,
            ),
          ),
          // AspectRatio(
          //   aspectRatio: 1,
          //   child: Icon(
          //     Icons.g_translate,
          //     color: Colors.deepPurple,
          //   ),
          // )
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double startAngle;
  final double sweepAngle;
  final bool isFilled;
  final Color color;
  final double strokeWidth;

  CirclePainter({
    this.startAngle = 0.0,
    this.sweepAngle = 360.0,
    this.isFilled = true,
    this.color = Colors.blue,
    this.strokeWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..addArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        toRadians(startAngle),
        toRadians(sweepAngle),
      )
      ..close();

    canvas.drawPath(
      path,
      Paint()
        ..style = isFilled ? PaintingStyle.fill : PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = color,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => false;
}
