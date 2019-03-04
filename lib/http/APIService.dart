import 'APICenter.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_app/model/Article.dart';
import 'package:flutter_app/model/Banner.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/http/DioManager.dart';


class APIService{
  void getBanner(Function callback) async {
    DioManager.singleton.dio.get(APICenter.HOME_BANNER, options: _getOptions()).then((response) {
      Map bannerMap = jsonDecode(response.toString());
      callback(Banner.fromJson(bannerMap));
    });
  }
  void getArticleList(Function callback,int _page) async {
    DioManager.singleton.dio.get(APICenter.HOME_ARTICLE_LIST+"$_page/json", options: _getOptions()).then((response) {
      Map articleMap = jsonDecode(response.toString());
      callback(Article.fromJson(articleMap));
    });
  }

  Options _getOptions() {
    Map<String,String> map = new Map();
    List<String> cookies = User().cookie;
    map["Cookie"] = cookies.toString();
    return Options(headers: map);
  }
}