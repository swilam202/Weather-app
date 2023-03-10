import 'package:flutter/material.dart';

class ThemeServices {
  static Gradient dayGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(217, 206, 155, 1.0),
      Color.fromRGBO(245, 200, 13, 1.0),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
  static Gradient nightGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(42, 60, 93, 1.0),
      Colors.black,
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static Color dayColor = const Color.fromRGBO(232, 215, 111, 1.0);
  static Color nightColor = const Color.fromRGBO(42, 60, 93, 1.0);
}
