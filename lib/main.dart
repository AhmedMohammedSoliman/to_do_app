import 'package:flutter/material.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      routes: {
        Home_Screen.routeName : (context) => Home_Screen(),
      },
      theme : MyTheme.LightTheme,
      darkTheme: MyTheme.DarkTheme,
    );
  }

}



