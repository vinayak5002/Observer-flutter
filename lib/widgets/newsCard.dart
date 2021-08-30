import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  NewsCard( {required this.imageURL, required this.title, required this.desc} );
  
  late String imageURL;
  late String title;
  late String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              
              Image.network(imageURL),
      
              SizedBox(
                height: 20,
              ),
      
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textScaleFactor: 1.5,
              ),
      
              SizedBox(height: 20,),
      
              Text(
                desc,
                style: TextStyle(
                  
                ),
                textScaleFactor: 1.3,
              ),
      
            ],
          ),
        ),
      ),
    );
  }
}