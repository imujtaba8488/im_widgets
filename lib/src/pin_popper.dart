import 'package:flutter/material.dart';

import 'package:im_shapes/im_shapes.dart';


class PinPopper extends StatefulWidget {
  final double radius;

  PinPopper({this.radius = 100.0});

  @override
  _PinPopperState createState() => _PinPopperState();
}

class _PinPopperState extends State<PinPopper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation float;

  bool show = false;

  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    float = Tween(begin: widget.radius / 2.0, end: 0.0)
        .animate(CurvedAnimation(
      curve: Curves.elasticOut,
      parent: controller,
    ));

    Animation opacity = Tween(begin: 0.0, end: 1.0).animate(controller);

    return Container(
      // height: widget.radius * 2,
      width: widget.radius * 2,
      child: Stack(
        children: [
          show
              ? Positioned(
                  left: widget.radius / 2.0,
                  top: float.value,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Pin(
                      radius: widget.radius / 1.1,
                      child: Icon(
                        Icons.home,
                        size: widget.radius / 1.5,
                      ),
                    ),
                  ),
                )
              : Container(),
          Positioned(
            top: widget.radius * 1.5,
            width: widget.radius * 2,
            child: InkWell(
              onTap: () {
                setState(() {
                  show = !show;
                });

                controller.reset();
                controller.forward();
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  // borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'When',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
