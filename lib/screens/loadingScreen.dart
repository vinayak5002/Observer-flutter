import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:the_observer_flutter/logic/api.dart';


class LoadingScreen extends StatefulWidget {
  LoadingScreen( {required this.changeMode} );

  late final Function changeMode;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() { 
    getData("all_news", context, widget.changeMode);
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: Colors.white,
      size: 100.0,
    );
  }
}