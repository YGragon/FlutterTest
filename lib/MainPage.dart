import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/MinePage.dart';
import 'package:flutter_app/Publish.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new MainPageWidget());
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '发布', '我的'];
  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [
        getTabImage('images/bar_home_unselected.png'),
        getTabImage('images/bar_home_selected.png')
      ],
      [
        getTabImage('images/bar_publish_unselected.png'),
        getTabImage('images/bar_publish_selected.png')
      ],
      [
        getTabImage('images/bar_me_unselected.png'),
        getTabImage('images/bar_me_selected.png')
      ]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new PublishPage(),
      new MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    // 初始化数据
    initData();
    return Scaffold(
      // 内容
      body: _pageList[_tabIndex],
      // 导航栏
      bottomNavigationBar: new BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
        ],
        // 点击 item 会有淡入淡出效果
        type: BottomNavigationBarType.shifting,
        //默认选中首页
        currentIndex: _tabIndex,
        // 图标大小
        iconSize: 24.0,
        // 点击事件
        onTap: _onItemTapped,
      ),

    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

}
