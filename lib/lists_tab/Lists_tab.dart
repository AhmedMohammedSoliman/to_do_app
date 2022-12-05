import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../theme_data.dart';
import 'package:to_do_app/providers/provider_class.dart';

class ListsTab extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: provider.appMode == ThemeMode.light ?
            Colors.blue : Colors.white,
            dayColor: MyTheme.blueLightColor,
            activeDayColor: MyTheme.blueLightColor,
            activeBackgroundDayColor: Colors.white,
            dotsColor: MyTheme.blueLightColor,
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ) ,
          SizedBox(height: 20,),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context , index) => Container(
                height: 20,
                width: double.infinity,
              ),
                itemBuilder: (context , index) => Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: provider.appMode == ThemeMode.light ?
                          Colors.white : Color(0xFF141922)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 10,
                        height: 70,
                        color: provider.appMode ==
                            ThemeMode.light ? Colors.blue : Color(0xFF6DA4E8),
                      ) ,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(AppLocalizations.of(context)!.play_basket_ball, style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold ,
                          color: provider.appMode ==
                              ThemeMode.light ? Colors.blue : Color(0xFF6DA4E8),),) ,
                          Text(AppLocalizations.of(context)!.time ,style: provider.appMode ==
                          ThemeMode.light ? Theme.of(context).textTheme.headline3 :
                          TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold ,)),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 90,
                        child: ElevatedButton(
                          onPressed: (){
                          },
                          child: Icon(Icons.check , size: 30,) ,
                          style: ElevatedButton.styleFrom( primary: provider.appMode ==
                              ThemeMode.light ? Colors.blue : Color(0xFF6DA4E8),

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30) ,
                              )
                          ),),
                      )
                    ],
                  ),
                ) ,
            itemCount: 20,),
          )
        ],
      ),
    );
  }
}