import 'package:flutter/material.dart';
import 'main.dart';

class Styles {
  static TextStyle labelTextStyle({Color color = Colors.white}) {
    return TextStyle(
      color: color,
    );
  }

  static InputDecoration decoration(BuildContext context) {
    return InputDecoration(
      hintStyle: TextStyle(color: Colors.white54),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: themeIdentify(context) ? firstColor : secondColor,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: themeIdentify(context) ? firstColor : secondColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 3,
          color: themeIdentify(context) ? firstColor : secondColor,
        ),
      ),
    );
  }
}


// loginpage-8f7dc firebase projectid