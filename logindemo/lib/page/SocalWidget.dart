import 'package:flutter/material.dart';

/// 创建时间：2019/7/19
/// 作者：admin
/// 描述：
class SocalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: color),
        ),
        child: Icon(img));
  }

  SocalWidget({this.color, this.img});

  List<Color> color;
  IconData img;
}
