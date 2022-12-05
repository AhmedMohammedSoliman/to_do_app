
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider_class.dart';

class ShowLanguageBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
   return Container(
     padding: EdgeInsets.all(10),
     child: Column(
       children: [
         InkWell(
           onTap: (){
             provider.changeLanguage("en");
           },
           child: provider.appLanguage == "en" ? selectedShape(context, AppLocalizations.of(context)!.english) :
               unSelectedShape(context , AppLocalizations.of(context)!.english)
         ),
         SizedBox(height: 20,),
         InkWell(
           onTap: (){
             provider.changeLanguage("ar");
           },
           child: provider.appLanguage == "ar" ? selectedShape(context , AppLocalizations.of(context)!.arabic) :
               unSelectedShape(context , AppLocalizations.of(context)!.arabic)
         )
       ],
     ),
   );
  }
  Widget selectedShape (BuildContext context , String text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$text" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold ,
            fontSize: 14),),
        Icon(Icons.check , size: 25,)
      ],
    );
  }
  Widget unSelectedShape (BuildContext context , String text){
    return Row(
      children: [
        Text("$text", style: Theme.of(context).textTheme.headline1,)
      ],
    );
  }
}