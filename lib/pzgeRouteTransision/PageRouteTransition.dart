import 'package:flutter/cupertino.dart';
import 'package:to_do_app/lists_tab/updateScreen.dart';

Route CreateRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => UpdateScreen() ,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return Align(alignment : Alignment.centerLeft , child: SizeTransition(child: child, sizeFactor: animation ,),);
    },
  );
}