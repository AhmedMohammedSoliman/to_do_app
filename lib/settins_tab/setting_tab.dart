import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/settins_tab/showLanguageSheet.dart';
import 'package:to_do_app/settins_tab/showModeSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/providers/provider_class.dart';

import '../theme_data.dart';

class SettingsTab extends StatefulWidget{

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 20 , right: 20 , left:  20),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language, style: provider.appMode == ThemeMode.light ?
          Theme.of(context).textTheme.headline1 : TextStyle(color: Colors.white ,
              fontSize: 14 , fontWeight: FontWeight.bold )) ,
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet ();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light ? Colors.white :
                  Color(0xff141922),
                border: Border.all(color: MyTheme.blueLightColor) ,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appLanguage == "en" ?
                  AppLocalizations.of(context)!.english :
                  AppLocalizations.of(context)!.arabic , style: provider.appMode == ThemeMode.light ?
                    TextStyle(color: Colors.black) : TextStyle(color: Color(0xFF6DA4E8))) ,
                  SizedBox(height: 20,),
                  Icon(Icons.arrow_drop_down_outlined, color: provider.appMode == ThemeMode.light ?
    Colors.black : Color(0xFF6DA4E8))
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text(AppLocalizations.of(context)!.mode , style: provider.appMode == ThemeMode.light ?
          Theme.of(context).textTheme.headline1 : TextStyle(color: Colors.white ,
              fontSize: 14 , fontWeight: FontWeight.bold )) ,
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              showModeBottomSheet ();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light ? Colors.white :
                Color(0xff141922),
                  border: Border.all(color: MyTheme.blueLightColor) ,
                  borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appMode == ThemeMode.light ?
                  AppLocalizations.of(context)!.light :
                  AppLocalizations.of(context)!.dark , style: provider.appMode == ThemeMode.light ?
          TextStyle(color: Colors.black) : TextStyle(color: Color(0xFF6DA4E8))) ,
                  Icon(Icons.arrow_drop_down_outlined , color: provider.appMode == ThemeMode.light ?
                    Colors.black : Color(0xFF6DA4E8),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet (){
    showModalBottomSheet(
        context: context,
        builder: (context) =>ShowLanguageBottomSheet() );
  }
  void showModeBottomSheet (){
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowModeBottomSheet());
  }
}