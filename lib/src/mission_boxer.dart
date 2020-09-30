import 'package:flutter/material.dart';

import 'package:im_shapes/im_shapes.dart';

class MissionBoxer extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;

  MissionBoxer({
    this.child,
    this.alignment,

    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MissionBox(),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              alignment: alignment,
              padding: padding,
              height: constraints.maxHeight / 1.1,
              child: child ?? Container(),
            );
          },
        )
      ],
    );
  }
}
