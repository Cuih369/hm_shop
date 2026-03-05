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
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _carouselController,
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
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSeach() {
    return Positioned(
      left: 20,
      top: 20,
      right: 20,
      height: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(78, 74, 78, 0.502),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          child: Row(
            children: [Icon(Icons.search), SizedBox(width: 10), Text('搜索')],
          ),
        ),
      ),
    );
  }

  Widget _getDoit() {
    return Positioned(
      left: 0,
      bottom: 10,
      right: 0,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (int index) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(index);
              },
              child: AnimatedContainer(
                // 动画容器
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: _currentIndex == index
                      ? Colors.white
                      : Color.fromRGBO(122, 121, 120, 0.5),
                ),
                height: 6,
                width: _currentIndex == index ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('HmSlider received bannerList: ${widget.bannerList}');
    print('HmSlider received bannerList length: ${widget.bannerList.length}');
    for (int i = 0; i < widget.bannerList.length; i++) {
      print(
        'Banner $i: id=${widget.bannerList[i].id}, imageUrl=${widget.bannerList[i].imageUrl}',
      );
    }
    return Stack(children: [_getSlider(), _getSeach(), _getDoit()]);
  }
}
