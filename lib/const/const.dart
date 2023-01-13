import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';


Color kTextColor1 = HexColor('#000000');
Color kTextColor3 = HexColor('#3b3f41');
Color kBorderSide = HexColor('#ebeaef');
Color kFilledColor = HexColor('#f9f9fb');
Color kButtonColor = HexColor('#796db7');
Color kBorderColor = HexColor('#e8e8e8');
Color kLightButtonColor = HexColor('#9e98c1');
Color kGreyColor = HexColor('#7D7883');

Color kTextColor2 = HexColor('#000000').withOpacity(0.9);

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: ButtonThemeData(buttonColor: Colors.amber,disabledColor: Colors.black)
);
   ThemeData _lightTheme = ThemeData(
              accentColor: Colors.pink,
              brightness: Brightness.light,
              primaryColor: Colors.blue
            );