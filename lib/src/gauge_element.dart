import 'package:flutter/material.dart';

class GaugeElement extends StatelessWidget {
  final CustomPainter painter;
  final EdgeInsets padding;

  GaugeElement({
    @required this.painter,
    this.padding = const EdgeInsets.all(30.0),
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: padding,
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(
              painter: painter,
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
          ),
        );
      },
    );
  }
}
