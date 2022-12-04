import 'package:flutter/material.dart';

class ShowModeBottomSheet extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Light" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold ,
                  fontSize: 15)) ,
              Icon(Icons.check , color: Colors.red,)
            ],
          ) ,
          SizedBox(height: 20,),
          Row(
            children: [
              Text("Dark" , style: TextStyle( fontWeight: FontWeight.bold ,
                  fontSize: 15),)
            ],
          )
        ],
      ),
    );
  }
}