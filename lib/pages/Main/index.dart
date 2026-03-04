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
        appBar: AppBar(title: Center(child: Text('首页'))),
        body: SafeArea(child: _bodyList[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.black,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          unselectedItemColor: Colors.black54,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
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
    );
  }
}
