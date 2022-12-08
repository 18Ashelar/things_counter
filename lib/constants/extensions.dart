import 'package:flutter/animation.dart';

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension ColorParsing on Color {
 

  String colorToString() {
    String colorString = toString(); // Color(0x12345678)
    String valueString =
        colorString.split('(')[1].split(')')[0]; // kind of hacky..
    return valueString;
  }
}
