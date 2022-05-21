import 'package:flutter/widgets.dart';

class DeviceHelper {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static bool isShortestSize = false;
  static bool hasSafeArea = false;
  final double _shortestSide = 568.0; // Screen height of iPhone 5s

  void init(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    isShortestSize = screenHeight <= _shortestSide;
    if (_mediaQueryData.viewPadding.bottom > 0 &&
        _mediaQueryData.viewPadding.top > 0) {
      hasSafeArea = true;
    } else {
      hasSafeArea = false;
    }
  }
}
