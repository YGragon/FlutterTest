import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunctionPage extends StatefulWidget {
  @override
  createState() => new FunctionPageState();
}

class FunctionPageState extends State<FunctionPage> {
  Widget buildGrid() {
    return new GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: _buildGridTileList(30));
  }

  /// 单个 item 布局
  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              decoration: new BoxDecoration(
                border: new Border.all(width: 10.0, color: Colors.black38),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
              ),
              child: new GestureDetector(
                child: new Image.asset('images/wali.jpg', fit: BoxFit.cover),
                onTap: () {
                  if (index % 2 == 0) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('prepare open image...'),
                    ));
                  } else {
                    _neverSatisfied();
                  }
                },
              ),
            ));
  }

  /// 弹出弹窗
  Future<void> _neverSatisfied() async {
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
}
