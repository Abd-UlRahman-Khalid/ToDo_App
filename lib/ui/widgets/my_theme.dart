import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary=Color(0xFF5D9CEC);
  static const Color colorGray=Color(0xFFC8C9CB);
    static const Color lightScaffoldBackgroundColor=Color(0xFFDFECDB);
  static final lightTheme=ThemeData(
    primaryColor: lightPrimary,
    appBarTheme:const AppBarTheme(
      color: lightPrimary
    ),
    scaffoldBackgroundColor: lightScaffoldBackgroundColor,
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedIconTheme: IconThemeData(
        color: lightPrimary,
        size: 36
      ),
      unselectedIconTheme: IconThemeData(
        color: colorGray,
        size: 36
      )
    ),
    bottomSheetTheme:const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18)
        )
      )
    ),
    textTheme:const TextTheme(
      headlineMedium: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
      headlineSmall: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
    )

  );
}