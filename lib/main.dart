import 'package:flutter/material.dart';

import 'src/experimental/gauge1.dart';

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
        body: Gauge1(),
      ),
    );
  }
}
