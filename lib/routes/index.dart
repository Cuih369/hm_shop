import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget GetRouterWidget() {
  return MaterialApp(initialRoute: '/', routes: getRootRoutes());
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    '/': (context) => MainPage(), //首页路由
    '/login': (context) => LoginPage(), //登录路由
  };
}
