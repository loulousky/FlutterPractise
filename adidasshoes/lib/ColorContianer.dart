import 'package:flutter/material.dart';

/// 创建时间：2019/7/22
/// 作者：admin
/// 描述：
typedef callback1 = void Function(int position);

class ColorContianer extends StatefulWidget {
  ColorContianer(this.color, this.callback, this.poisiton, this.currentpositon);

  Color color;
  callback1 callback;
  int poisiton;
  int currentpositon;

  @override
  State<StatefulWidget> createState() {
    return ColorState();
  }
}


class ColorState extends State<ColorContianer> {
  bool _hasChose(){
    return widget.poisiton==widget.currentpositon;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        widget.callback(widget.poisiton);
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow:_hasChose()? [BoxShadow(

            color: widget.color,
            offset: Offset(0, 2),
            blurRadius:2,
            spreadRadius: 2

          )]:null,
        ),
        child: ClipPath(
          clipper:MClipper(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color:  widget.color,
          ),


        ),
      ),
    );
  }
}
class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}