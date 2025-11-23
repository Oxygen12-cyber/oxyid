import 'package:flutter/material.dart';
import 'dart:math';

extension ResponsiveSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // Responsive height (percentage)
  double hp(double percentage) => height * (percentage / 100);

  // Responsive width (percentage)
  double wp(double percentage) => width * (percentage / 100);
}

Color getRandomColor() {
  final random = Random();
  // final int alpha = random.nextInt(256);
  final int red = random.nextInt(256);
  final int green = random.nextInt(256);
  final int blue = random.nextInt(256);
  final Color color = Color.fromARGB(255, red, green, blue);
  return color;
}
