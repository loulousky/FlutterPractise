import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyRect extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(RRect.fromLTRBAndCorners(
        size.width / 2 - 80, 0, size.width / 2 + 80, size.height,
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  double dx=0;
  double dy=0;
  bool ischange=false;
  List<String> nowImage;


  List<String> _image() {
    List<String> images = List<String>();
    images.add("assets/image_01.png");
    images.add("assets/image_02.jpg");
    images.add("assets/image_03.jpg");
    return images;
  }

  @override
  void initState() {
    nowImage=_image();
    super.initState();

  }


  void changImage(){
   String image=nowImage.removeAt(0);
   nowImage.add(image);


  }

  Widget _scrollcard() {
    return GestureDetector(
      onHorizontalDragStart: (state) {
        print("滑动开始");
      },
      onHorizontalDragEnd: (state) {
        //判断设置一个滑动的最大阀值，超过了就可以让当前的页面放到最后面，更新List的列表
        if(dx.abs()>200){
          changImage();
        }
        setState(() {
          dx = 0;
          dy = 0;
        });
        print("滑动结束");
      },
      onHorizontalDragCancel: () {
        print("滑动取消");
        setState(() {
          dx = 0;
          dy = 0;
        });
      },
      onHorizontalDragUpdate: (state) {
        setState(() {
          if (state.delta.dx < 0) {
            dx = dx - 10;
          } else {
            dx = dx + 10;
          }


          // dy =  state.delta.distance;
        });

        print("滑动更新");
        print("滑动距离${dx}");
      },
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Padding(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.3),
                              offset: Offset(0, 10)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(nowImage[2]),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "ReadNow",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF-Pro-Text-Bold.otf"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 15,
                          ),
                          child: Text(
                            "Animated",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          ),
          Padding(
            child: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.3),
                              offset: Offset(0, 10)),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage(nowImage[1]),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "ReadNow",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "SF-Pro-Text-Bold.otf"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2,
                            horizontal: 15,
                          ),
                          child: Text(
                            "Animated",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          ),
          Padding(
            child: Transform.translate(
              offset: Offset(dx, dy),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12.withOpacity(0.3),
                                offset: Offset(0, 10)),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage(nowImage[0]),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "ReadNow",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF-Pro-Text-Bold.otf"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.blue),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 15,
                            ),
                            child: Text(
                              "Animated",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF485563), Color(0xFF29323C)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              color: Colors.white,
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Trending",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "Calibre-Semibold",
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.deepOrange),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          child: Text(
                            "Animated",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "+25 stories",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      )
                    ],
                  ),
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      _scrollcard(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Favourite",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "Calibre-Semibold",
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 15,
                          ),
                          child: Text(
                            "Animated",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "+25 stories",
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      )
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.3),
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: AssetImage("assets/image_04.jpg"),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
