import 'package:flutter/material.dart';
import 'package:im_widgets/src/radial_gauge/gauge_element.dart';

import 'painters/dial_painter.dart';
import 'painters/pointer_painter.dart';
import 'painters/range_painter.dart';

class RadialGauge extends StatefulWidget {
  final Color backgroundColor;
  final double startAngle;
  final double sweepAngle;
  final int dataPoints;
  final int pointTo;
  final int rangeMultiplier;
  final TextStyle textStyle;
  final double rangeInsets;
  final PointerDecoration pointerDecoration;
  final DialDecoration dialDecoration;

  RadialGauge({
    this.backgroundColor,
    this.startAngle = 120,
    this.sweepAngle = 300,
    this.dataPoints = 10,
    this.pointTo = 0,
    this.rangeMultiplier = 1,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.black),
    this.rangeInsets = 20.0,
    this.pointerDecoration = const PointerDecoration(),
    this.dialDecoration = const DialDecoration(),
  }) {
    assert(
      startAngle >= 0 && startAngle <= 350,
      "startAngle must be from 0 to 350",
    );

    assert(
      sweepAngle >= 190.0 && sweepAngle <= 350.0,
      'sweepAngle must be from 190 to 350',
    );

    assert(
      pointTo >= 0 && pointTo <= dataPoints,
      'pointTo must be from 0 to points',
    );

    assert(rangeMultiplier > 0, 'rangeMultiplier must be greater than 0.');
  }

  @override
  _RadialGaugeState createState() => _RadialGaugeState();
}

class _RadialGaugeState extends State<RadialGauge> {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.width,
      child: Container(
        color: widget.backgroundColor ?? Colors.grey[50],
        child: Stack(
          children: [
            GaugeElement(
              padding: const EdgeInsets.all(15.0),
              painter: DialPainter(
                  startAngle: widget.startAngle,
                  sweepAngle: widget.sweepAngle,
                  points: widget.dataPoints,
                  showLines: true,
                  decoration: widget.dialDecoration),
            ),
            GaugeElement(
              padding: const EdgeInsets.all(25.0),
              painter: DialPainter(
                startAngle: widget.startAngle,
                sweepAngle: widget.sweepAngle,
                points: widget.dataPoints,
                showLines: false,
                decoration: DialDecoration(
                  color: widget.backgroundColor ?? Colors.grey[50],
                ),
                isFilled: true,
              ),
            ),
            GaugeElement(
              padding: EdgeInsets.all(widget.rangeInsets),
              painter: RangePainter(
                startAngle: widget.startAngle,
                sweepAngle: widget.sweepAngle,
                points: widget.dataPoints,
                rangeMultiplier: widget.rangeMultiplier,
                textStyle: widget.textStyle,
              ),
            ),
            GaugeElement(
              padding: EdgeInsets.all(widget.rangeInsets * 0.5),
              painter: PointerPainter(
                points: widget.dataPoints,
                startAngle: widget.startAngle,
                sweepAngle: widget.sweepAngle,
                pointTo: widget.pointTo,
                decoration: widget.pointerDecoration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
