import 'package:flutter/material.dart';
import 'package:the_observer_flutter/logic/api.dart';
import 'package:the_observer_flutter/widgets/newsCard.dart';

import 'menuScreen.dart';

class MainScreen extends StatelessWidget {
  MainScreen( {required this.newslist, required this.changeMode} );

  final List<NewsCard> newslist;
  final Function changeMode;
  
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
                    MaterialPageRoute(builder: (context) => MenuScreen(changeMode: changeMode,))
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
            children: newsList,
          ),
        ),
      ),
  );
  }
}