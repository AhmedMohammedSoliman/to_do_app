import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/lists_tab/updateScreen.dart';
import 'package:to_do_app/providers/provider_class.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../collectionClass/task.dart';
import '../firebase_fun.dart';


class ItemList extends StatefulWidget{
  Task task ;
  ItemList({required this.task});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  IconData icon = Icons.check ;
  Color buttonColor = Colors.blue ;
  Color containerColor = Colors.blue;
  Color titleColor = Colors.blue ;
  Color descriptionColor = Color(0xFFA9A9A9) ;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return  Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.3,
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            flex: 1,
            onPressed: (context){
              deleteTaskFromFireBase(widget.task).timeout(Duration(milliseconds: 400) , onTimeout: (){
                showDialog(
                    context: context,
                    builder: (context)=> AlertDialog(
                        content: ListTile(
                          leading: Text("Deleted!" , style: TextStyle(color: Colors.blue , fontSize: 30)),
                          trailing: Icon(Icons.done_all_outlined , color: Colors.blue,size: 30,),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    );
              });
            },
            borderRadius: BorderRadius.circular(20),
            autoClose: false,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, UpdateScreen.routeName ,
          arguments: {
            "title" :  widget.task.title,
            "description" : widget.task.description,
            "task" : widget.task
          });

        },
        child: Container(
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
                    ThemeMode.light ? containerColor : Color(0xFF6DA4E8),
              ) ,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${widget.task.title}", style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold ,
                    color: provider.appMode ==
                        ThemeMode.light ? titleColor : Color(0xFF6DA4E8),),) ,
                  Text("${widget.task.description}",style: provider.appMode ==
                      ThemeMode.light ? TextStyle(
                      fontWeight: FontWeight.bold , fontSize: 18 , color: descriptionColor) :
                  TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold ,)),
                ],
              ),
              Container(
                height: 30,
                width: 90,
                child: ElevatedButton(
                  onPressed: (){
                    isDoneTask(widget.task).timeout(Duration(milliseconds: 400) , onTimeout: (){
                      print("Updated");
                      icon = Icons.cloud_done ;
                      buttonColor = Colors.green ;
                      containerColor = Colors.green ;
                      descriptionColor = Colors.green;
                      titleColor = Colors.green ;
                      setState((){});
                    });
                  },
                  child: Icon(icon , size: 30,) ,
                  style: ElevatedButton.styleFrom( primary: provider.appMode ==
                      ThemeMode.light ? buttonColor : Color(0xFF6DA4E8),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30) ,
                      )
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}