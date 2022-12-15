import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_fun.dart';
import 'package:to_do_app/providers/provider_class.dart';
import '../collectionClass/task.dart';
import '../theme_data.dart';

class UpdateScreen extends StatefulWidget{
  static const String routeName = "updateScreen";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {

  var form1Key = GlobalKey<FormState>();
  var form2Key = GlobalKey<FormState>();
  DateTime selectedTime = DateTime.now();
  String textTitle = "";

  String descriptionText = "";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;

    var provider = Provider.of<MyAppProvider>(context);
    return Scaffold(
      backgroundColor: provider.appMode == ThemeMode.light ? Color(0xFFDFECDB) :
      Color(0xFF060E1E),
      appBar: AppBar(
        backgroundColor: provider.appMode == ThemeMode.light ?
        MyTheme.blueLightColor : Color(0xFF6DA4E8),
        title: Text(AppLocalizations.of(context)!.to_do_list, style: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                key: form1Key,
                child: TextFormField(
                  onChanged: (text) {
                    textTitle = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "${args["title"]}",
                    enabledBorder: provider.appMode == ThemeMode.light ?
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)) :
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              Form(
                key: form2Key,
                child: TextFormField(
                  onChanged: (text) {
                    descriptionText = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "${args["description"]}",
                    enabledBorder: provider.appMode == ThemeMode.light ?
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)) :
                    UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.select_time,
                    style: provider.appMode == ThemeMode.light ?
                    Theme
                        .of(context)
                        .textTheme
                        .headline2 : TextStyle(color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),),
                ],
              ),
              InkWell(
                onTap: () {
                  showCalender();
                },
                child: Text(
                  "${selectedTime.month}/${selectedTime.day}/${selectedTime
                      .year}", style: provider.appMode == ThemeMode.light ?
                Theme
                    .of(context)
                    .textTheme
                    .headline3 : TextStyle(color: Color(0xFFA9A9A9),
                    fontWeight: FontWeight.bold,
                    fontSize: 18), textAlign:
                TextAlign.center,),
              ),
              ElevatedButton.icon(onPressed: () {
                if (form1Key.currentState!.validate() == true &&
                    form2Key.currentState!.validate() == true) {
                  updateTask(args["task"]).timeout(
                      Duration(milliseconds: 300), onTimeout: () {
                    Navigator.pop(context);
                  });
                }
              },
                icon: Icon(Icons.check, size: 30,),
                label: Text(AppLocalizations.of(context)!.save_changes,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(30)
                )),
              )

            ],
          ),
        ),
      ),
    );
  }

  showCalender() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (choosenDate != null) {
      selectedTime = choosenDate;
    }
    setState(() {});
  }

  Future<void> updateTask(Task task) {
    return getCollectionFromFirebase().doc(task.id).update({
      "title": textTitle,
      "description": descriptionText
    });
  }
}