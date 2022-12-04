import 'package:flutter/material.dart';

class ShowBottomSheet extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add new Task" , style: TextStyle(color: Color(0xFF383838) ,
          fontWeight: FontWeight.bold , fontSize: 18), textAlign: TextAlign.center,) ,
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter your Task" ,
              hintMaxLines: 10
            ),
          ) ,
          TextFormField(
            decoration: InputDecoration(
              hintText: "Enter Description of Task"
            ),
          ),
          Text("Select time" , style: TextStyle(color: Color(0xFF383838) ,
              fontWeight: FontWeight.bold , fontSize: 18),) ,
          Text("12 : 00 AM" , textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFA9A9A9) ,
              fontWeight: FontWeight.bold , fontSize: 18)) ,
          ElevatedButton.icon(
              onPressed: (){

              }, icon: Icon(Icons.check , size: 30,),

          label: Text("Add" , style: TextStyle(
              fontWeight: FontWeight.bold , fontSize: 18),),
            style: ElevatedButton.styleFrom(shape:
            RoundedRectangleBorder(side: BorderSide(
              color: Colors.white , width: 2
            ),borderRadius: BorderRadius.all(Radius.circular(30)))),
          )
        ],
      ),
    );
  }
}