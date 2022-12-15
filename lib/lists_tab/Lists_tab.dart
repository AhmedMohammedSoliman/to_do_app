import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/collectionClass/task.dart';
import 'package:to_do_app/firebase_fun.dart';
import 'package:to_do_app/lists_tab/itemList.dart';
import '../theme_data.dart';
import 'package:to_do_app/providers/provider_class.dart';


class ListsTab extends StatefulWidget{

  @override
  State<ListsTab> createState() => _ListsTabState();
}

class _ListsTabState extends State<ListsTab> {
  List<Task> taskList = [] ;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    getCollectionFromFirebase();
    var provider = Provider.of<MyAppProvider>(context);
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              selectedDate = date ;
              setState((){});
            },
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
                itemBuilder: (context , index) => ItemList(task: taskList[index]),
            itemCount: taskList.length,),
          )
        ],
      ),
    );
  }
  getTasksFromFireBase ()async{
    QuerySnapshot<Task> collection =  await getCollectionFromFirebase().get();
    taskList =  collection.docs.map((doc) => doc.data()).toList();
    setState((){
      taskList = taskList.where((task) {
        DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(task.date);
        if (selectedDate.year == dateTime.year && selectedDate.month == dateTime.month &&
            selectedDate.day == dateTime.day){
          return true ;
        }
        return false ;
      }).toList();

      taskList.sort((Task task1 , Task task2){
        DateTime datetime1 = DateTime.fromMicrosecondsSinceEpoch(task1.date);
        DateTime datetime2 = DateTime.fromMicrosecondsSinceEpoch(task2.date);
        return datetime1.compareTo(datetime2);
      });
    });

  }

 }


