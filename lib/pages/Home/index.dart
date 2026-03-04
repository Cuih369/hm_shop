import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/components/Home/HnHot.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerModel> bannerList = [
    BannerModel(
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.png',
      id: '1',
    ),
    BannerModel(
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png',
      id: '2',
    ),
    BannerModel(
      imageUrl:
          'https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.png',
      id: '3',
    ),
  ];
  List<Widget> _getScrollChildern() {
    return [
      SliverToBoxAdapter(
        child: HmSlider(bannerList: bannerList), //轮播图
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10), //间距
      ),
      SliverToBoxAdapter(
        child: HmCategory(), //分类
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10), //间距
      ),
      SliverToBoxAdapter(
        child: HmSuggestion(), //推荐
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10), //间距
      ),
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HnHot()),
            SizedBox(width: 10),
            Expanded(child: HnHot()),
          ],
        ), //热门
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 10), //间距
      ),
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildern());
  }
}
