import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_observer_flutter/screens/mainScreen.dart';
import 'package:the_observer_flutter/widgets/newsCard.dart';
import '../constants/constans.dart';
import 'package:http/http.dart' as API ;

List<NewsCard> newsList = [

];

void getData( String newsType, BuildContext context ) async{

  API.Response response = await API.get( Uri.parse(kNewsType + newsType + kNumber + "15") );

  var data = response.body;

  print("reached here");

  newsList.clear();
  var i=0;
  for( ;i<10; i++){
    NewsCard newCard = NewsCard(
      imageURL: jsonDecode(data) ['articles'] [i] ['image_url'],
      title: jsonDecode(data) ['articles'] [i] ['title'],
      desc: jsonDecode(data) ['articles'] [i] ['description'],
    ); 
    
    newsList.add(newCard);
  }


  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainScreen( newslist: newsList, ))
  );

}

void changeData ( String newsType, BuildContext context) async{
  newsType = newsType.toLowerCase();

  if(newsType == "home"){
    newsType = "all_news";
  }

  API.Response response = await API.get( Uri.parse(kNewsType + newsType + kNumber + "15") );

  var data = response.body;

  print(newsType.toLowerCase());

  newsList.clear();
  var i=0;
  for( ;i<10; i++){
    NewsCard newCard = NewsCard(
      imageURL: jsonDecode(data) ['articles'] [i] ['image_url'],
      title: jsonDecode(data) ['articles'] [i] ['title'],
      desc: jsonDecode(data) ['articles'] [i] ['description'],
    ); 
    print(jsonDecode(data) ['articles'] [i] ['title']);
    
    newsList.add(newCard);
  }

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MainScreen( newslist: newsList, ))
  );
}