import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppProvider extends ChangeNotifier{

  String appLanguage = "en" ;
   ThemeMode appMode = ThemeMode.light;

  void changeLanguage (String newLanguage){
    if (appLanguage == newLanguage){
      return ;
    }else {
      appLanguage = newLanguage ;
    }
    notifyListeners();
  }

  void changeMode (ThemeMode newMode){
    if (appMode == newMode){
      return ;
    }else {
      appMode = newMode ;
    }
    notifyListeners() ;
  }
}