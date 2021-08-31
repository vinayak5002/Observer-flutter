import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_observer_flutter/constants/constans.dart';
import 'package:the_observer_flutter/logic/api.dart';
import 'package:the_observer_flutter/widgets/newsCard.dart';
import 'package:http/http.dart' as API ;


import 'menuScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen( {required this.newslist, required this.changeMode, required this.newsType} );

  final List<NewsCard> newslist;
  final Function changeMode;
  final String newsType;

  int moreCount = 1;
  String LoadStatus = "Load more";
  int dummy = 0;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void updateList(List<NewsCard> newsList, NewsCard newCard){
    setState(() {
      newsList.add(newCard);
    });
  }

  @override
  Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop: () async => false,
      child: Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuScreen(changeMode: widget.changeMode,))
                  );
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
  
        body: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                children: newsList,
              ),

              ElevatedButton(
                onPressed: () async{
                  print("tapped");
                  if(widget.moreCount <= 3){
                    print("data can be loaded");
                    widget.moreCount ++;
                    checkData(widget.moreCount, widget.newsType, updateList);

                    if(dataAvailable){
                      print("Updating list");
                    }
                    else{
                      print("can't load data");
                      setState(() {
                        widget.LoadStatus = "Unable to load more";
                      });
                    }
                  }
                  else{
                    setState(() {
                      widget.LoadStatus = "Unable to load more";
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(widget.LoadStatus, style: TextStyle(fontWeight: FontWeight.bold),),
                      Icon(CupertinoIcons.down_arrow, size: 20,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
  );
  }
}
