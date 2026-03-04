import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/Home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerModel> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  double get ScrollerWidth => MediaQuery.of(context).size.width; // 屏幕宽度
  Widget _getSlider() {
    return CarouselSlider(
      items: // 轮播图列表
      List.generate(widget.bannerList.length, (int index) {
        return Image.network(
          widget.bannerList[index].imageUrl,
          fit: BoxFit.cover,
          width: ScrollerWidth,
        );
      }),
      options: // 轮播图视图配置
      CarouselOptions(
        viewportFraction: 1.0, // 轮播图视图比例
        autoPlay: true, // 自动播放
        autoPlayInterval: Duration(seconds: 3), // 自动播放间隔
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
