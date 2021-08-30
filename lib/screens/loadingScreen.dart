import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_observer_flutter/logic/api.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() { 
    getData("all_news", context);
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: Colors.white,
      size: 100.0,
    );
  }
}