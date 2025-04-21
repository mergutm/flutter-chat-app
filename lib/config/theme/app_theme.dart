import 'package:flutter/material.dart';

class AppTheme {
  final int indexColor;

  final List<Color> _colorThemes = [
    Colors.indigo,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.teal,
  ];

  AppTheme({this.indexColor = 0}) {
    assert(
      indexColor >= 0 && indexColor <= _colorThemes.length - 1,
      'El índice debe estar entre 0 y ${_colorThemes.length - 1}',
    );
  }

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[indexColor],
      brightness: Brightness.light,
    );
  }
}
