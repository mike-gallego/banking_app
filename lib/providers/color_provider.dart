import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  ColorProvider();

  final List<Color>? colors = [
    Colors.deepOrange[100]!,
    Colors.greenAccent[100]!,
    Colors.yellowAccent[100]!,
    Colors.purpleAccent[100]!,
    Colors.lightBlueAccent[100]!,
  ];

  Color getColor() => colors![Random().nextInt(colors!.length)];
}
