import 'package:flutter/material.dart';

class ShowLanguageBottomSheet extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(20),
     child: Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("English" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold ,
             fontSize: 15)) ,
             Icon(Icons.check , color: Colors.red,)
           ],
         ) ,
         SizedBox(height: 20,),
         Row(
           children: [
             Text("Arabic" , style: TextStyle( fontWeight: FontWeight.bold ,
                 fontSize: 15),)
           ],
         )
       ],
     ),
   );
  }
}