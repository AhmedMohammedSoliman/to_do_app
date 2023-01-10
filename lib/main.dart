import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/providers/provider_class.dart';
import 'package:to_do_app/theme_data.dart';
import 'package:to_do_app/lists_tab/updateScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return MyAppProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
late MyAppProvider provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<MyAppProvider>(context);
     getPrefs();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home_Screen.routeName,
      routes: {
        Home_Screen.routeName : (context) => Home_Screen(),
        UpdateScreen.routeName : (context) =>UpdateScreen() ,
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      locale: Locale(
         provider.appLanguage
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: ThemeMode.light,

    );
  }
  void getPrefs ()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
  var lang =  prefs.getString("language")!;
  provider.changeLanguage(lang)  ;
  }
}



