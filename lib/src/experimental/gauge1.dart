import 'package:flutter/material.dart';
import 'package:im_widgets/src/painters/pointers/pointer_painter.dart';
import 'package:im_widgets/src/painters/range/range_painter.dart';

import '../gauge_element.dart';
import 'dial1.dart';

class Gauge1 extends StatefulWidget {
  @override
  _Gauge1State createState() => _Gauge1State();
}

class _Gauge1State extends State<Gauge1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GaugeElement(
            painter: Dial1(),
          ),
          GaugeElement(
            padding: EdgeInsets.all(40),
            painter: RangePainter(
              points: 12,
              textStyle: TextStyle(fontSize: 14),
            ),
          ),
          GaugeElement(
            padding: EdgeInsets.all(40),
            painter: PointerPainter(points: 12, pointTo: 12),
          )
        ],
      ),
    );
  }
}
