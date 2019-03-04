import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/FunctionModel.dart';

class FunctionPage extends StatefulWidget {
  @override
  createState() => new FunctionPageState();
}

class FunctionPageState extends State<FunctionPage> {

  // 显示的 GridView 集合
  List<FunctionModel> funcList = new List();

  Widget buildGrid() {
    return new GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: _buildGridTileList(funcList.length));
  }

  /// 单个 item 布局
  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              child: new Card(
                color: Colors.grey[500],
                elevation: 5.0,
                child: new GestureDetector(
                      child: new Column(
                        children: <Widget>[
                          new Image.asset('images/wali.jpg', fit: BoxFit.cover),
                          new Padding( padding: new EdgeInsets.only(top: 10.0)),
                          new Text(funcList[index].textDesc.toString()),
                        ],
                      ),
                      onTap: () {
                        switch(funcList[index].id){
                          case 1:
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('prepare open image...'),
                            ));
                            break;
                          case 2:
                            _showDialog();
                            break;
                          case 3:
                            print("ViewPager");
                            break;
                          case 4:
                            print("GridView");
                            break;
                          default:
                            break;
                        }

                      },
                    ),
              ),
            ));
  }

  /// 弹出弹窗
  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

  /// 初始化，理论上只有初始化一次
  @override
  void initState() {
    super.initState();
    print("数据初始化");
    FunctionModel f1 = new FunctionModel();
    f1.id = 1;
    f1.textDesc = "Show SnackBar";
    funcList.add(f1);
    FunctionModel f2 = new FunctionModel();
    f2.id = 2;
    f2.textDesc = "Show Dialog";
    funcList.add(f2);
    FunctionModel f3 = new FunctionModel();
    f3.id = 3;
    f3.textDesc = "ViewPager";
    funcList.add(f3);
    FunctionModel f4 = new FunctionModel();
    f4.id = 4;
    f4.textDesc = "GridView";
    funcList.add(f4);
  }

  /// 在 initState 之后调用，此时可以获取其他 State
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// 销毁，只会调用一次。
  @override
  void dispose() {
    super.dispose();
    funcList.clear();
  }

  /// 改变数据
  @override
  void setState(VoidCallback fn) {

  }
}
