import 'dart:ui';
import 'package:flutter/material.dart';

class MyTheme {
  static Color blueLightColor = Colors.blue ;
  static Color blueDarkColor = Color (0xFF5D9CEC) ;

 static ThemeData lightTheme = ThemeData(
   scaffoldBackgroundColor: Color(0xFFDFECDB),
    appBarTheme: AppBarTheme(
      backgroundColor: blueLightColor ,
          elevation: 0
    ) ,
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: Color(0xFF5D9CEC) ,
     unselectedItemColor: Color(0xFFC8C9CB),
     backgroundColor: Colors.transparent,
       elevation: 0
   ) ,
   textTheme: TextTheme(
     headline1: TextStyle(
    fontSize: 14 , fontWeight: FontWeight.bold , color: Color(0xFF303030)
     ),
       headline2: TextStyle(
           fontSize: 18 , fontWeight: FontWeight.bold , color: Color(0xFF303030)
       ) ,
     headline3: TextStyle(
       fontWeight: FontWeight.bold , fontSize: 18 , color: Color(0xFFA9A9A9)
     )
   )
  ) ;

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF060E1E),
    appBarTheme: AppBarTheme(
      backgroundColor: blueDarkColor ,
      elevation:  0
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF6DA4E8) ,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.transparent,
          elevation: 0
      )
  );
}