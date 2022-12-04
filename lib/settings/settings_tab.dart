import 'package:flutter/material.dart';
import 'package:to_do_app/home/showLanguageSheet.dart';
import 'package:to_do_app/home/showModeSheet.dart';
import 'package:to_do_app/theme_data.dart';

class SettingsTab extends StatefulWidget{

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(10),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Text("Language" , style: Theme.of(context).textTheme.headline2,) ,
         SizedBox(height: 20,),
         InkWell(
           onTap: (){
             showLanguageBottomSheet();
           },
           child: Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
               color: MyTheme.whiteColor,
               borderRadius: BorderRadius.circular(20),
               border: Border.all(color: MyTheme.blueColorLight)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("English") ,
                 Icon(Icons.arrow_drop_down_outlined)
               ],
             ),
           ),
         ),
         SizedBox(height: 20,),
         Text("Mode" , style: Theme.of(context).textTheme.headline2,) ,
         SizedBox(height: 20,),
         InkWell(
           onTap: (){
             showModeBottomSheet ();
           },
           child: Container(
             padding: EdgeInsets.all(10),
             decoration: BoxDecoration(
                 color: MyTheme.whiteColor,
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: MyTheme.blueColorLight)
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Light") ,
                 Icon(Icons.arrow_drop_down_outlined)
               ],
             ),
           ),
         ),
       ],
     ),
    );
  }

  void showLanguageBottomSheet (){
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowLanguageBottomSheet() );
  }
  void showModeBottomSheet (){
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowModeBottomSheet() );
  }
}