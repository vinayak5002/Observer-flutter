import 'package:flutter/material.dart';
import 'package:the_observer_flutter/screens/loadingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

bool darkMode = false;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() { 
    super.initState();
    getModeData();
  }

  void getModeData() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool? temp = pref.getBool("darkMode");

    if(temp == null){
      temp = false;
    }

    setState(() {
      darkMode = temp!;
    });
  }

  changeTheme()async{
    setState(() {
      if(darkMode){
        darkMode = false;
      }
      else{
        darkMode = true;
      }
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("darkMode", darkMode);
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: darkMode ? 
      ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        )
      )
      :
      ThemeData(
        scaffoldBackgroundColor: Colors.orange[400],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange[400],
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
      
          centerTitle: true,
          title: Text(
            "The Observer",
            style: TextStyle(
              color: Colors.white,
            ),
            textScaleFactor: 1.4,
          ),
      
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  print("Menu tapped");
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      
        body: LoadingScreen(changeMode: changeTheme),
      ),
    );
  }
}

