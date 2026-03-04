import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            height: 80,
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text('分类$index', style: TextStyle(color: Colors.white)),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
