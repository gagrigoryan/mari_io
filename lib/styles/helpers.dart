import 'package:flutter/material.dart';

class ScreenDimension {
  late double screenWidth;
  late double screenHeight;
  static const int _layoutWidth = 375;
  static const int _layoutHeight = 812;

  ScreenDimension(Size size) {
    screenWidth = size.width;
    screenHeight = size.height;
  }

  double getWidth(double target) {
    return screenWidth * target / _layoutWidth;
  }

  double getHeight(double target) {
    return screenHeight * target / _layoutHeight;
  }

  @override
  String toString() {
    return "ScreenDimension(width: $screenWidth, height: $screenHeight)";
  }
}
