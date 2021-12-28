
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  //this color for scaffold background color
  scaffoldBackgroundColor: Colors.white,
  //this color for the screen background color
  backgroundColor: Colors.white,
  //this customize for appBar
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    actionsIconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      //this color for the top of the device screen ==> status bar
      statusBarColor: Colors.white,
      //this for brightness
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  primarySwatch: Colors.deepOrange,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  //this color for scaffold background color
  scaffoldBackgroundColor: const Color(0xFF333739),
  //this color for the screen background color
  backgroundColor: Colors.white,
  //this customize for appBar
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    actionsIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xFF333739),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      //this color for the top of the device screen ==> status bar
      statusBarColor: Color(0xFF333739),
      //this for brightness
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 20.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color(0xFF333739),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);