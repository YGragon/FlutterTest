import 'package:flutter/material.dart';
import 'package:flutter_app/HomeDetailPage.dart';
import 'package:english_words/english_words.dart';


class HomePage extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<HomePage> {
  // 保存建议的单词对
  final _suggestions = <WordPair>[];
  // 集合存储用户喜欢（收藏）的单词对
  final _saved = new Set<WordPair>();

  // 增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 副标题字体样式
  final _smallFont = const TextStyle(fontSize: 12.0,fontWeight: FontWeight.bold,color: Colors.red );

  // 头像样式
  final _userHeadImage =  Image(width: 32,height: 32,image: NetworkImage(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),fit: BoxFit.cover,);

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('首页'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share), onPressed: _pushSaved),
        ],
      ),


      body: _buildSuggestions(),
    );
  }

  // listView 列表
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }
  // listView 每一行的内容和样式
  Widget _buildRow(WordPair pair) {
    // 检查确保单词对还没有添加到收藏夹中
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text(
        pair.asString,
        style: _smallFont,
      ),
      //item 前置图标
      leading: _userHeadImage,
      // item 后置图标
      trailing: new GestureDetector(
        child: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: (){
          // 通知框架状态已经改变
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      ),
      onTap: () {
        onItemClick(pair);
      },
    );
  }
  void onItemClick(WordPair pair) {
    print(pair.toString());
    // 跳转详情页面
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) =>  HomeDetailPage(pair: pair,),));
  }

  void _pushSaved() {
    // 跳转收藏页面的方法
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
              (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        // 添加1像素的分割线
        final divided = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();
        // 收藏页面
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      },
    ),);
  }



}