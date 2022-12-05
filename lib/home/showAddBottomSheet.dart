import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider_class.dart';

class ShowAddBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Container(
      color: provider.appMode == ThemeMode.light ?
      Colors.white : Color(0xFF141922),
      padding: EdgeInsets.all(15),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(AppLocalizations.of(context)!.add_your_task, style: provider.appMode == ThemeMode.light?
          Theme.of(context).textTheme.headline2 : TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold), textAlign: TextAlign.center,) ,
          TextFormField(

            decoration: InputDecoration(
              enabledBorder: provider.appMode == ThemeMode.light ?
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)):
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

              hintText: AppLocalizations.of(context)!.enter_task_title,
               hintStyle: TextStyle(color: provider.appMode == ThemeMode.light ? Colors.black : Colors.white)
            ),
          ) ,
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: provider.appMode == ThemeMode.light ?
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)):
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              hintText: AppLocalizations.of(context)!.enter_task_descreption ,
              hintStyle: TextStyle(color: provider.appMode == ThemeMode.light ? Colors.black : Colors.white)
            ),
          ) ,
          Text(AppLocalizations.of(context)!.select_time , style: provider.appMode == ThemeMode.light?
          Theme.of(context).textTheme.headline2 : TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),),
          Text("12 : 00 AM" , style: provider.appMode == ThemeMode.light ?
          Theme.of(context).textTheme.headline3 : TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18), textAlign:
            TextAlign.center,) ,
          ElevatedButton.icon(onPressed: (){

          },
          icon: Icon(Icons.check , size:  30,),
          label: Text(AppLocalizations.of(context)!.add, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),) ,
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white , width: 3) ,
            borderRadius: BorderRadius.circular(30)
          )),)
        ],
      ),
    );
  }
}