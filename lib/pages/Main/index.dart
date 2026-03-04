import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';
import 'package:hm_shop/pages/categor/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      'icon': 'lib/assets/t1.svg',
      'activeIcon': 'lib/assets/t1-act.svg',
      'title': '首页',
    },
    {
      'icon': 'lib/assets/t2.svg',
      'activeIcon': 'lib/assets/t2-act.svg',
      'title': '分类',
    },
    {
      'icon': 'lib/assets/t3.svg',
      'activeIcon': 'lib/assets/t3-act.svg',
      'title': '购物车',
    },
    {
      'icon': 'lib/assets/t4.svg',
      'activeIcon': 'lib/assets/t4-act.svg',
      'title': '我的',
    },
  ];
  int _currentIndex = 0;
  final List<Widget> _bodyList = [
    HomeView(),
    CategorView(),
    CartView(),
    MineView(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: const Center(child: Text('首页'))),
        body: SafeArea(
          child: IndexedStack(index: _currentIndex, children: _bodyList),
        ),

        // 保留核心Container（提供圆角、margin、背景色）
        bottomNavigationBar: Container(
          height: 80, // 总高度
          margin: const EdgeInsets.only(
            bottom: 12,
            right: 12,
            left: 12,
          ), // 外部间距
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // 圆角
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 2),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias, // 裁剪圆角（必须）
          // 用Padding包裹BottomNavigationBar，实现内部垂直居中
          child: Padding(
            // 上下内边距：让内容在80px高度内垂直居中
            // 可根据需要调整：值越大，图标/文字越居中
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFFB983FF),
              unselectedItemColor: const Color(0xFFCCCCCC),
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              currentIndex: _currentIndex,
              elevation: 0, // 去掉默认阴影
              onTap: (index) => setState(() => _currentIndex = index),
              items: _tabList
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(item['icon']!),
                      activeIcon: SvgPicture.asset(item['activeIcon']!),
                      label: item['title'],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
