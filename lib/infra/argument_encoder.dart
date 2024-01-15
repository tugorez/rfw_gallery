import 'package:flutter/material.dart';

final class ArgumentEncoder {
  static Map<String, Object?> iconData(IconData iconData) {
    return <String, Object?>{
      'codePoint': iconData.codePoint,
      'fontFamily': iconData.fontFamily,
    };
  }
}
