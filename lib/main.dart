import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_observer_flutter/logic/api.dart';
import 'package:the_observer_flutter/screens/loadingScreen.dart';
import 'package:the_observer_flutter/widgets/newsCard.dart';

void main() {
  runApp(MyApp());
}

List <NewsCard> newsList = [
  
];

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.orange[400],
          appBar: AppBar(
            backgroundColor: Colors.orange[400],
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
      
          body: LoadingScreen(),
        ),
      ),
    );
  }
}

