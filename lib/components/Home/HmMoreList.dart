import 'package:flutter/material.dart';

class HmMoreList extends StatefulWidget {
  HmMoreList({Key? key}) : super(key: key);

  @override
  _HmMoreListState createState() => _HmMoreListState();
}

class _HmMoreListState extends State<HmMoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //列数
        mainAxisSpacing: 10, //行间距
        crossAxisSpacing: 10, //列间距
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue,
          height: 100,
          alignment: Alignment.center,
          child: Text('更多$index', style: TextStyle(color: Colors.white)),
        );
      },
      itemCount: 10,
    );
  }
}
