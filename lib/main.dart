import 'package:flutter/material.dart';
import 'package:im_widgets/src/gauges/radial_gauge.dart';

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
          startAngle: 0,
          dataPoints: 40,
          pointTo: 15,
        ),
      ),
    );
  }
}
