import 'package:flutter/material.dart';
import 'package:im_widgets/src/meter/circular_shape_assembler.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircularShapeAssembler(),
        ),
      ),
    );
  }
}
