import 'package:flutter/material.dart';


ThemeData defaultTheme() {
  TextTheme textTheme(TextTheme _base) {
    return _base.copyWith(
        headline: _base.headline.copyWith(color: Colors.blue, fontSize: 300),
        body1: _base.body1.copyWith(color: Colors.blue),
        body2: _base.body2.copyWith(
          color: Colors.blueGrey,
          fontSize: 12
        ),
        title: _base.title.copyWith(
          fontSize: 100,
          color: Colors.blue
        ),
        //for the large numbers in the middle of the screen
        display1: _base.display1.copyWith(color: Colors.blueGrey[100].withOpacity(0.8), fontSize: 300),
        display2: _base.display1.copyWith(color: Colors.red, fontSize: 300));
  }

  final ThemeData _base = ThemeData.light();
  return _base.copyWith(
      textTheme: textTheme(_base.textTheme),
      primaryColor: Colors.blueGrey[900],
      backgroundColor: Colors.grey[900]);
} //end defaultTheme ThemeData
