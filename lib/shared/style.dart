import 'package:app1/shared/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      toolbarTextStyle: TextStyle(
        color: lightTextColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
    primarySwatch: primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      textTheme: ButtonTextTheme.primary,
    ),
    primaryColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
    )),
    textTheme: const TextTheme(
        button: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        caption: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        )),
    cardColor: Colors.white,
    cardTheme: const CardTheme(
      elevation: 5,
      shadowColor: Colors.grey,
    ));

ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 37, 36, 36),
      toolbarTextStyle: TextStyle(
        color: lightTextColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      labelStyle: TextStyle(color: Colors.white),
      iconColor: Colors.grey,
      prefixIconColor: Colors.grey,
    ),
    primarySwatch: primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.amber,
      textTheme: ButtonTextTheme.primary,
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 37, 36, 36),
    primaryColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
    )),
    textTheme: const TextTheme(
      button: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
      caption: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white))),
    listTileTheme: const ListTileThemeData(
      textColor: Colors.grey,
    ),
    cardColor: const Color.fromARGB(255, 37, 36, 36),
    cardTheme: const CardTheme(
      elevation: 5,
      shadowColor: Colors.grey,
    ));
