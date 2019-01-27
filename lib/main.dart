import 'package:flutter/material.dart';
import 'package:flutter_app/MainPage.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Flutter Test',
      // 修改主题颜色
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MainPage(),
//      home: new RandomWords(),
    );
  }
}


