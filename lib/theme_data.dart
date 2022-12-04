import 'package:flutter/material.dart';

class MyTheme {
  static Color blueColorLight = Color(0xFF5D9CEC);
  static Color whiteColor = Colors.white;
  static Color greenColor = Color(0xFF61E757);
  static Color blackColor = Color (0xFF383838);
  static Color redColor = Color(0xFFE43737);
  static Color blueColorDark = Color (0xFF5D9CEC);
  static Color backGroungdark = Color(0xFF060E1E);
  static Color backGroundLight = Color(0xFFDFECDB);

  static ThemeData LightTheme = ThemeData(
    scaffoldBackgroundColor: backGroundLight ,
    appBarTheme: AppBarTheme(
      backgroundColor: blueColorLight ,
      elevation: 0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF5D9CEC),
      unselectedItemColor: Color(0xFFC8C9CB),
      backgroundColor: Colors.transparent ,
       elevation: 0
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold
      ) ,
      headline2: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ,
      color: Color(0xFF303030))
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyTheme.blueColorLight,
    )
  );

  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: backGroungdark ,
    appBarTheme: AppBarTheme(
      backgroundColor: blueColorDark
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Color(0xFF5D9CEC) ,
      unselectedItemColor: Color(0xFFFFFFFF),
    )

  );
}