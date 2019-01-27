import 'package:flutter/material.dart';

class PublishPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new Page();
  }
}

class Page extends State<PublishPage> {

  List<IconData> _icons = []; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          titleSection(context),
          contentSection(context),
//          gridImageSection(context)

        ],
      ),
    );
  }

  // 标题栏
  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('发布'));
  }

  //定义一个controller
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _contextController = new TextEditingController();

  // 监听输入的标题
  @override
  void initState() {

    // 初始化数据
    _retrieveIcons();

    // 监听标题输入改变
    _titleController.addListener(() {
      print(_titleController.text);
    });
    // 监听内容输入变化
    _contextController.addListener(() {
      print(_contextController.text);
    });
  }
  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
  // 标题输入框
  Widget titleSection(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: new TextField(
        controller: _titleController,
        decoration: new InputDecoration(
          hintText: '输入标题',
//          border: InputBorder.none,
        ),
      ),
    );
  }

  // 内容输入框
  Widget contentSection(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: new TextField(
        controller: _contextController,
        maxLines: 10,
        decoration: new InputDecoration(
          hintText: '输入内容',
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget gridImageSection(BuildContext context){
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 1.0 //显示区域宽高相等
        ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        }
    );
  }
}
