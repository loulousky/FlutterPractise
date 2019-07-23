import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:gradient_text/gradient_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int currentPosition = 0;
  PageController controller;


  List<String> images() {
    List<String> imgaes = List<String>();
    imgaes.add("assets/illustration.png");
    imgaes.add("assets/illustration2.png");
    imgaes.add("assets/illustration3.png");

    return imgaes;
  }

  bool currentPostion(int position) {
    return currentPosition == position;
  }

  List<String> titles() {
    List<String> imgaes = List<String>();
    imgaes.add("MUSIC");
    imgaes.add("SPA");
    imgaes.add("TRAVEL");

    return imgaes;
  }

  List<String> desc() {
    List<String> imgaes = List<String>();
    imgaes.add("EXPERIENCE WICKED PLAYLISTS");
    imgaes.add("FEEL THE MAGIC OF WELLNESS");
    imgaes.add("LET'S HIKE UP");
    return imgaes;
  }

  @override
  void initState() {
    controller = PageController(initialPage: currentPosition);
    controller.addListener(() {
    });





    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29323C)],
            begin: AlignmentDirectional.centerStart,
            end: AlignmentDirectional.centerEnd,
          )),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PageView.builder(
              controller: controller,
              onPageChanged: (page){
                setState(() {
                  currentPosition = page;
                });
              },
              itemBuilder: (context, position) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        images()[position],
                        fit: BoxFit.contain,
                      ),
                      width: 300,
                      height: 300,
                      margin: EdgeInsets.only(top: 100),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, left: 50),
                        child: GradientText(titles()[position],
                            gradient: LinearGradient(colors: [
                              Colors.deepPurple,
                              Colors.blue,
                            ]),
                            style: TextStyle(fontSize: 44),
                            textAlign: TextAlign.center),
                      ),
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Padding(
                        padding: EdgeInsets.only(left:( 50), top: 15),
                        child: Text(
                          desc()[position],
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),


                  ],
                );
              },
              itemCount: 3,
            ),
          ),
        ),
        Positioned(
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {

                  setState(() {
                    currentPosition = 0;
                    controller.jumpToPage(currentPosition);
                  });
                },
                child: Container(
                  width: 50,
                  height: 10,
                  decoration: BoxDecoration(
                      color: currentPostion(0) ? Colors.grey : Colors.black12,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
              ),
              GestureDetector(
                onTap: () {

                  setState(() {
                    currentPosition = 1;
                    controller.jumpToPage(currentPosition);

                  });
                },
                child: Container(
                  width: 50,
                  height: 10,
                  decoration: BoxDecoration(
                    color: currentPostion(1) ? Colors.grey : Colors.black12,
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {

                    setState(() {
                      currentPosition = 2;
                      controller.jumpToPage(currentPosition);
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                        color: currentPostion(2) ? Colors.grey : Colors.black12,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  )),
            ],
          ),
          left: 50,
          bottom: 50,
        ),
        Positioned(
          child: currentPosition == 2
              ? FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                )
              : Container(),
          right: 10,
          bottom: 50,
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


}
