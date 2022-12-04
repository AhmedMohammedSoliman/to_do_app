import 'package:flutter/material.dart';
import 'package:to_do_app/home/showBottomSheet.dart';

import '../lists/lists_tab.dart';
import '../settings/settings_tab.dart';
import '../theme_data.dart';

class Home_Screen extends StatefulWidget{
  static const String routeName = "home" ;

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white , width: 3),
          borderRadius: BorderRadius.circular(30)
        ),
        onPressed: (){
          showBottomSheet();
          setState((){});
        } ,
        child: Icon(Icons.add , size:  30,),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          title: Container(
            margin: EdgeInsets.only(left: 20 ,
             top: 20),
            child: Text("To Do List" , style: TextStyle(
                color: Colors.white , fontSize: 22 , fontWeight: FontWeight.bold)),
          ),
        ),
      ) ,
      bottomNavigationBar:ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(40) ,
        topLeft: Radius.circular(40)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              selectedIndex = index ;
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
  void showBottomSheet (){
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowBottomSheet());
  }
  List<Widget> tabs = [ListsTab() , SettingsTab()] ;
}