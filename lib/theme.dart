import 'package:flutter/material.dart';

const Color customDarkPrimaryColor =
    Color.fromARGB(255, 97, 97, 97); // Example dark color
const Color customDarkAccentColor =
    Color.fromARGB(255, 209, 76, 76); // Example accent color
const Color customDarkBackgroundColor = Color.fromARGB(255, 24, 24, 24);
const Color customDarkSurfaceColor = Color(0xFF424242);
const Color customDarkTextColor = Color(0xFFFFFFFF);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: customDarkPrimaryColor,
  hintColor: customDarkAccentColor,
  scaffoldBackgroundColor: customDarkBackgroundColor,
  cardColor: customDarkSurfaceColor,
  buttonTheme: const ButtonThemeData(
    buttonColor: customDarkAccentColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: customDarkAccentColor, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
    ),
  ),
  fontFamily: "Kanit-Light"
);