import 'package:flutter/material.dart';

class HnHot extends StatefulWidget {
  HnHot({Key? key}) : super(key: key);

  @override
  _HnHotState createState() => _HnHotState();
}

class _HnHotState extends State<HnHot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.blue,
        height: 200,
        alignment: Alignment.center,
        child: Text('热门', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
