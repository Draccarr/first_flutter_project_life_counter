import 'package:flutter/material.dart';

ThemeData defaultTheme() {
  TextTheme textTheme(TextTheme _base) {
    return _base.copyWith(
        headline: _base.headline.copyWith(color: Colors.deepOrange, fontSize: 300),
        body1: _base.body1.copyWith(color: Colors.deepOrange),
        title: _base.title.copyWith(
          fontSize: 100,
          color: Colors.blue
        ));
  }

  final ThemeData _base = ThemeData.light();
  return _base.copyWith(
      textTheme: textTheme(_base.textTheme),
      primaryColor: Colors.deepOrange,
      backgroundColor: Colors.black);
} //end defaultTheme ThemeData
