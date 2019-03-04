import 'package:flutter_app/model/Article.dart';

class DataCenter{
  factory DataCenter() => _getInstance();

  static DataCenter get instance => _getInstance();
  static DataCenter _instance;

  DataCenter._internal(){
    // 初始化
  }

  static DataCenter _getInstance(){
    if( null == _instance){
      _instance = new DataCenter._internal();
    }
    return _instance;
  }

}