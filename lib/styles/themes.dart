import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_project/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.black,
  primarySwatch: defaultColor,
  // to make all material to this color
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 50.0,
    selectedItemColor: defaultColor,
  ),
);
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.white,
  primarySwatch: defaultColor,
  // to make all material to this color
  scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(31, 31, 31, 1.0),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    color: Color.fromRGBO(31, 31, 31, 1.0),
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 50.0,
    unselectedItemColor: Colors.white,
    selectedItemColor: defaultColor,
    backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
  ),
);
