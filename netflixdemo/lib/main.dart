import 'package:flutter/material.dart';

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
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _topWidget() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 320,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 5),
                    blurRadius: 1.4,
                    spreadRadius: 0.5)
              ],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(150)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/banner.png"),
                  repeat: ImageRepeat.noRepeat)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "WATCH BEFORE EVERYONE",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.left,
                ),
                Text("The Punisher:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Text("Season 2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Row(
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      "watch now->",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget _BottonWidget() {
    return Padding(
      padding: EdgeInsets.only( right: 10),
      child:Row(
        children: <Widget>[
         Expanded(child:  Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 10,),
                  Text(
                    "Watch now",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "view more",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 240,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return position==0?Container(width: 100,):Column(
                      children: <Widget>[
                        Container(
                          width:120,
                          height: 150,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/avengers.jpg"),
                                  fit: BoxFit.cover
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Avengers:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Infinity War:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                  itemCount:4,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
         )
        ],

      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffececec),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("")),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_topWidget(), _BottonWidget()],
        ),
      ),
    );
  }
}
