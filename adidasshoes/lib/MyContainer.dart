import 'package:flutter/material.dart';

/// 创建时间：2019/7/22
/// 作者：admin
/// 描述：
typedef callback1 = void Function();

class MyContainer extends StatefulWidget {
  MyContainer(this.mypostion, this.currentposition, this.callback, this.num);

  int mypostion;
  int currentposition;
  callback1 callback;
  String num;

  @override
  State<StatefulWidget> createState() {
    return MyContainreState();
  }
 bool isChange(){
    return mypostion==currentposition;

 }

}

class MyContainreState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: Container(
        margin: EdgeInsets.all(5),
        alignment: AlignmentDirectional.center,
        width: 40,
        height: 40,
        decoration: widget.isChange()? BoxDecoration(color: Colors.red):BoxDecoration(color: Color(0xFF696D77)),
        child: Text(
          widget.num,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
