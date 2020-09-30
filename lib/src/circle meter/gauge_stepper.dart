import 'dart:math';

import 'package:flutter/material.dart';

import 'pointer.dart';
import 'circle.dart';

class GaugeStepper extends StatefulWidget {
  @override
  _GaugeStepperState createState() => _GaugeStepperState();
}

class _GaugeStepperState extends State<GaugeStepper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  double height = 0.0;
  double width = 0.0;

  double top = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 60),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: -90.0, end: 90.0).animate(controller);

    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        width = constraints.maxWidth;
        height = width / 2;

        return Stack(
          children: [
            Positioned(
              top: 0.0,
              width: width,
              child: Circle.semiUpward(),
            ),
            Positioned(
              top: height / 2,
              left: width / 4,
              height: height,
              child: Pointer(),
              // child: Transform.rotate(
              //   angle: animation.value * pi / 180,
              //   child: Pointer(),
              // ),
            ),
          ],
        );
      },
    );
  }

  Widget test() {
    return Container(
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.gamepad),
    );
  }
}
