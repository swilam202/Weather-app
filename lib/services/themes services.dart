import 'package:flutter/material.dart';

class ThemeServices {
  static Gradient dayGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(222, 185, 81, 0.8),
      Color.fromRGBO(234, 212, 140, 0.8),
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
