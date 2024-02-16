import 'package:flutter/material.dart';

class Themes{

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
    colorScheme:  ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.white

    )
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
      colorScheme:  ColorScheme.dark(
        primary: Colors.grey,
        secondary: Colors.yellow
      )
  );
}