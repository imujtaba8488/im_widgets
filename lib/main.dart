import 'package:flutter/material.dart';
import 'package:im_stepper/src/circle%20meter/circle.dart';
import 'package:im_stepper/src/circle%20meter/gauge_stepper.dart';

import 'im_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Stepper Example'),
        ),
        body: Align(child: Circle.full()),
      ),
    );
  }
}