import 'package:flutter/material.dart';

/// 创建时间：2019/7/19
/// 作者：admin
/// 描述：radiubuttn 自定义
typedef selectcallbanc = void Function(bool);

class RadiuWideget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RadiuState();
  }

  RadiuWideget({@required this.chagecallback, this.isselect});

  final selectcallbanc chagecallback;
   bool isselect=false;

}

class RadiuState extends State<RadiuWideget> {
  bool isselect;


  @override
  void initState() {
    isselect = widget.isselect;
  }

  Widget _getSelect() {
    return isselect
        ? Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 1)),
      child: Container(
        margin: EdgeInsets.all(2),
        decoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      ),
    )
        : Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: _getSelect(),
      onTap: () {
        setState(() {
          isselect = isselect ? false : true;
          //回调一下
          widget.chagecallback(isselect);
        });
      },

    );
  }
}
