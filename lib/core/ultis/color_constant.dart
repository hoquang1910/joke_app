import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color green = fromHex('#29b363');
  static Color blue = fromHex('#2c7edb');
  static Color silver = fromHex("#969696");
  static Color black = fromHex("#646464");

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
