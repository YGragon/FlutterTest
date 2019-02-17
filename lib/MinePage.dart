
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        // 去除顶部灰色状态栏
        padding: EdgeInsets.zero,
        children: <Widget>[
          header(context),
          new ListTile(
            title: new Text("收藏"),
            subtitle: new Text("我的收藏"),
            leading: Icon(Icons.favorite),
          ),
          new ListTile(
            title: new Text("夜间模式"),
            subtitle: new Text("夜间模式"),
            leading: Icon(Icons.track_changes),
          )
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('我的'));
  }

  Widget header(BuildContext context) {
    return new Image.asset(
        "images/wali.jpg",

    );
  }
}