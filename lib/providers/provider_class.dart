import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppProvider extends ChangeNotifier{

  String appLanguage = "en" ;
   ThemeMode appMode = ThemeMode.light;

  void changeLanguage (String newLanguage) async{
    if (appLanguage == newLanguage){
      return ;
    }else {
      appLanguage = newLanguage ;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setString("language", appLanguage);
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
   // language
  // void setPrefsLanguage ()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance() ;
  //   prefs.setString("language", appLanguage);
  // }

}