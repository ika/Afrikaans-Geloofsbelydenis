import 'package:flutter/material.dart';
import 'main/ma_mainpage.dart';

void main() {
  runApp(const GeloofsApp());
}

class GeloofsApp extends StatelessWidget {
  const GeloofsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geloofsbelydenis',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(58, 66, 86, 1.0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    );
  }
}
