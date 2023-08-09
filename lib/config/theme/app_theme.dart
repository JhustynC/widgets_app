import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.black,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Color.fromARGB(255, 85, 11, 27)
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  AppTheme({
    this.selectedColor = 0,
    required this.darkMode,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: darkMode ? Brightness.dark : Brightness.light,
      );
}
