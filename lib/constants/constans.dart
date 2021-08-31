import 'package:flutter/material.dart';

const String kNewsType = 'https://inshortsv2.vercel.app/news?type=';

const String kNumber = '&limit=';

ThemeData kDarkModeTheme = 
ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color?>(Colors.grey[800]),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: (Colors.grey[800])!)
        )
      ),
    ),
  ),
);

ThemeData kLightmodeTheme = 
ThemeData(
  scaffoldBackgroundColor: Colors.orange,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.orange,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color?>(Colors.orange),
      backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.white)
        )
      ),
    ),
  )
);