import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_observer_flutter/logic/api.dart';
import 'package:the_observer_flutter/main.dart';
import 'package:the_observer_flutter/widgets/menuCards.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen( {required this.changeMode} );

  late Function changeMode;

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool load = false;

  void loading(String cat){
    setState(() {
      load = true;
    });
    changeData(cat, context, widget.changeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          InkWell(
            onTap: () {
              widget.changeMode();
            },
            child: darkMode ?
            Icon(Icons.light_mode) :
            Icon(Icons.dark_mode),
          ),
          SizedBox(width: 10,)
        ],
    
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: load ?
          SpinKitRing(
            color: Colors.white,
            size: 100,
          )
          :
          ListView(
            children: [
              MenuCard(cat: "Home", loading: loading,),
              MenuCard(cat: "Automobile", loading: loading,),
              MenuCard(cat: "Business", loading: loading,),
              MenuCard(cat: "Education", loading: loading,),
              MenuCard(cat: "Entertainment", loading: loading,),
              MenuCard(cat: "Hatke", loading: loading,),
              MenuCard(cat: "World", loading: loading,),
              MenuCard(cat: "Politics", loading: loading,),
              MenuCard(cat: "Science", loading: loading,),
              MenuCard(cat: "Sports", loading: loading,),
              MenuCard(cat: "Technology", loading: loading,),
            ],
          ) ,
        ),
      ),
    );
  }
}