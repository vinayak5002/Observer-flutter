import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_observer_flutter/logic/api.dart';
import 'package:the_observer_flutter/widgets/menuCards.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({ Key? key }) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool load = false;

  void loading(String cat){
    setState(() {
      load = true;
    });
    changeData(cat, context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}