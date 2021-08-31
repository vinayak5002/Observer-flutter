import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_observer_flutter/screens/mainScreen.dart';
import 'package:the_observer_flutter/widgets/newsCard.dart';
import '../constants/constans.dart';
import 'package:http/http.dart' as API ;

List<NewsCard> newsList = [

];

bool dataAvailable = true;

void getData( String newsType, BuildContext context, Function changeMode ) async{

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
    MaterialPageRoute(builder: (context) => MainScreen( newslist: newsList, changeMode: changeMode, newsType: newsType,))
  );

}

void changeData ( String newsType, BuildContext context, Function changeMode) async{
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
    MaterialPageRoute(builder: (context) => MainScreen( newslist: newsList, changeMode: changeMode, newsType: newsType,))
  );
}

void checkData(int count, String newsType, Function updateList) async {

  int request = 10 + (count * 5) + 2;
  int head = newsList.length;

  API.Response response = await API.get( Uri.parse(kNewsType + newsType + kNumber + request.toString()) );

  var aditionalData = response.body;

  int articlesGot = jsonDecode(aditionalData) ["total"];

  if(articlesGot <= request){
    dataAvailable =  true;
    for(int i=0; i<5; i++){
      NewsCard newCard = NewsCard(
        imageURL: jsonDecode(aditionalData) ['articles'] [head] ['image_url'],
        title: jsonDecode(aditionalData) ['articles'] [head] ['title'],
        desc: jsonDecode(aditionalData) ['articles'] [head] ['description'],
      ); 
      print(jsonDecode(aditionalData) ['articles'] [head] ['title']);
      head++;

      updateList(newsList, newCard);
    }
  }
  else {
    dataAvailable = false;
  }

}

// void getMoreData(int count, String newsType, Function updateList)async{
//   int request = 10 + (count * 5) + 2;
//   int head = newsList.length;

//   API.Response response = await API.get( Uri.parse(kNewsType + newsType + kNumber + request.toString()) );

//   var aditionalData = response.body;

//   for(int i=0; i<5; i++){
//     NewsCard newCard = NewsCard(
//       imageURL: jsonDecode(aditionalData) ['articles'] [head] ['image_url'],
//       title: jsonDecode(aditionalData) ['articles'] [head] ['title'],
//       desc: jsonDecode(aditionalData) ['articles'] [head] ['description'],
//     ); 
//     print(jsonDecode(aditionalData) ['articles'] [head] ['title']);
//     head++;

//     updateList(newsList, newCard);
//   }

// }