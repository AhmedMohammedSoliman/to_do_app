import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/collectionClass/task.dart';
import 'package:to_do_app/firebase_fun.dart';
import 'package:to_do_app/providers/provider_class.dart';

class ShowAddBottomSheet extends StatefulWidget {
  @override
  State<ShowAddBottomSheet> createState() => _ShowAddBottomSheetState();
}

class _ShowAddBottomSheetState extends State<ShowAddBottomSheet> {
  String title = "" ;

  String description = "" ;

  DateTime selectedDate = DateTime.now();

  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();

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
          Form(
            key: form1Key,
            child: TextFormField(
              onChanged: (text){
                title = text ;
              },
              validator: (text){
                if (text == null || text.isEmpty){
                  return "Please enter title";
                }else {
                  return null ;
                }
              },
              decoration: InputDecoration(
                enabledBorder: provider.appMode == ThemeMode.light ?
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)):
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

                hintText: AppLocalizations.of(context)!.enter_task_title,
                 hintStyle: TextStyle(color: provider.appMode == ThemeMode.light ? Colors.black : Colors.white)
              ),
            ),
          ) ,
          Form(
            key: form2Key,
            child: TextFormField(
              onChanged: (text){
                description = text ;
              },
              validator: (text){
                if (text ==null || text.isEmpty){
                  return "Please enter descreption of title" ;
                }else {
                  return null ;
                }
              },

              decoration: InputDecoration(
                enabledBorder: provider.appMode == ThemeMode.light ?
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)):
                UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                hintText: AppLocalizations.of(context)!.enter_task_descreption ,
                hintStyle: TextStyle(color: provider.appMode == ThemeMode.light ? Colors.black : Colors.white)
              ),
            ),
          ) ,
          Text(AppLocalizations.of(context)!.select_time , style: provider.appMode == ThemeMode.light?
          Theme.of(context).textTheme.headline2 : TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),),
          InkWell(
            onTap: (){
              showCalender(context) ;
            },
            child : Text("${selectedDate.month}/${selectedDate.day}/${selectedDate.year}" , style: provider.appMode == ThemeMode.light ?
            Theme.of(context).textTheme.headline3 : TextStyle(color: Colors.white , fontWeight: FontWeight.bold , fontSize: 18), textAlign:
            TextAlign.center,) ,
          ),
          ElevatedButton.icon(onPressed: (){
               addTask();
          },
          icon: Icon(Icons.check , size:  30,),
          label: Text(AppLocalizations.of(context)!.add, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),) ,
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white , width: 3) ,
            borderRadius: BorderRadius.circular(30)
          )),
          )
        ],
      ),
    );
  }

  void showCalender(BuildContext context)async {
   var choosenDate =  await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
     if (choosenDate != null){
       selectedDate = choosenDate ;
     }
     setState((){});

  }

 addTask (){
    Task task = Task(
        title: title,
        description: description,
        date: selectedDate.microsecondsSinceEpoch) ;
   if (form1Key.currentState!.validate() == true && form2Key.currentState!.validate() == true){
  addTaskToFirebase(task).timeout(Duration(milliseconds: 400) , onTimeout: (){
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context) =>AlertDialog (
          content: ListTile(
            leading: Text("Done!" , style: TextStyle(color: Colors.blue , fontSize: 30)),
            trailing: Icon(Icons.done_all_outlined , color: Colors.blue,size: 30,),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
        )
    );

  });
   }
  }


}