import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomeDetailPage extends StatelessWidget {
  // Declare a field that holds the pair
  final WordPair pair;

  // In the constructor, require a pair
  HomeDetailPage({Key key, @required this.pair}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 标题内容
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text('Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          )),
          new Icon(Icons.star, color: Colors.red),
          new Text('41'),
        ],
      ),
    );

    // 先定义好中间按钮的其中一个样式
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                  fontSize: 12.0, fontWeight: FontWeight.w400, color: color),
            ),
          )
        ],
      );
    }

    // 中间的按钮
    Widget buttonSection = new Container(
      child: new Row(
        // 水平平均分配
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    // 内容部分
    Widget textSection = new Container(
      padding: EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${pair.asPascalCase}"),
      ),
      body: new ListView(
        padding: EdgeInsets.zero,
        children: [
          new Stack(alignment: const Alignment(0.6, 0.6),
            children: [
              new Image.asset(
                'images/wali.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              new Container(
                child: new Text(
                  'Mia B',
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],),

          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
