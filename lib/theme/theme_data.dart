import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ThemeClass{
  ThemeClass._();

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(),
      appBarTheme:  AppBarTheme(
        backgroundColor: HexColor('#796db7'),
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      primaryColorLight: Color(0xff03203C),
      primaryColorDark: Color(0xff242B2E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      )
  );
}