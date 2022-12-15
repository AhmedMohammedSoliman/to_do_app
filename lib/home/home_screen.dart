import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/home/showAddBottomSheet.dart';
import '../lists_tab/Lists_tab.dart';
import '../settins_tab/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_app/providers/provider_class.dart';

import '../theme_data.dart';

class Home_Screen extends StatefulWidget{
  static const String routeName = "home" ;

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0 ;
  String title = "To Do List " ;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Scaffold(
      backgroundColor: provider.appMode == ThemeMode.light ? Color(0xFFDFECDB) :
      Color(0xFF060E1E),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white , width: 3),
          borderRadius: BorderRadius.circular(30)
        ),
        onPressed: (){
          showAddBottomSheet();
          setState((){});
        } ,
        child: Icon(Icons.add , size:  30,),
          backgroundColor: provider.appMode == ThemeMode.light ? MyTheme.blueLightColor :
          Color(0xFF6DA4E8),
      ),
      appBar: AppBar(
        backgroundColor: provider.appMode == ThemeMode.light ?
        MyTheme.blueLightColor : Color(0xFF6DA4E8),
        title: Text("$title", style: TextStyle(
            color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold)),
      ) ,
      bottomNavigationBar:ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40) ,
        topLeft: Radius.circular(40)),
        child: BottomAppBar(
          color: provider.appMode == ThemeMode.light ? Colors.white :
          Color(0xff141922),
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index ;
              switch(index) {
                case 0 : {title = AppLocalizations.of(context)!.to_do_list ;}
                  break ;
                case 1 : {title = AppLocalizations.of(context)!.settings ;}
                  break ;
              }
              setState((){});
            },
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Icon_list.png")) ,
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/Icon_settings.png")) ,
                  label: "") ,
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
  void showAddBottomSheet (){
    showModalBottomSheet(
  context: context,
  builder: (context) => ShowAddBottomSheet()) ;
}

  List<Widget> tabs = [ListsTab() , SettingsTab()] ;
}