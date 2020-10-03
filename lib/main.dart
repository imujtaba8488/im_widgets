import 'package:flutter/material.dart';
import 'package:im_widgets/src/radial_gauge/painters/dial_painter.dart';
import 'package:im_widgets/src/radial_gauge/painters/pointer_painter.dart';

import 'src/radial_gauge/radial_gauge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('im_widgets'),
        ),
        body: RadialGauge(
          backgroundColor: Colors.black,
          pointTo: 10,
          dataPoints: 50,
          dialDecoration: DialDecoration(color: Colors.white, width: 1),
          pointerDecoration: PointerDecoration(color: Colors.white, width: 2),
          textStyle: TextStyle(
            color: Colors.amber,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
