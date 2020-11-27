import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'aMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geloofsbelydenis',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: aMain(),
    );
  }
}
