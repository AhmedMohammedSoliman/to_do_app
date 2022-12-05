import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider_class.dart';

class ShowModeBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeMode(ThemeMode.light);
            },
            child: provider.appMode == ThemeMode.light ? selectedShape(context , AppLocalizations.of(context)!.light) :
                unSelectedShape(context , AppLocalizations.of(context)!.light)
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.changeMode(ThemeMode.dark);
            },
            child: provider.appMode == ThemeMode.dark ? selectedShape(context , AppLocalizations.of(context)!.dark) :
                unSelectedShape(context , AppLocalizations.of(context)!.dark)
          )
        ],
      ),
    );
  }
  Widget selectedShape (BuildContext context , String text){
    return Row(
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