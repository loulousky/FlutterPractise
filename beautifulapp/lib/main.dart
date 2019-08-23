import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _myWidge;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _myWidge = _head();
    super.didChangeDependencies();
  }

  /**
   * 竖向两圆
   */
  Widget _twoRound(Color colros) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
      Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colros,
      ),

    ),
    SizedBox(height: 10,),
    Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: colros,
    ),
    )
    ],

    );
    }

  /**
   * 自定义Widget
   */
  Widget _getTwoRoundWidget(Color bigColr, Color smallStrackColor,
      Color smallColor, String text, bool right) {
    return Stack(
      children: <Widget>[
        //大的圆
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: bigColr,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
        ),

        //小的圆

        right
            ? Positioned(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(color: smallStrackColor, width: 5),
                shape: BoxShape.circle,
                color: smallColor),
          ),
          right: 5,
          top: 0,
        )
            : Positioned(
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                border: Border.all(color: smallStrackColor, width: 5),
                shape: BoxShape.circle,
                color: smallColor),
          ),
          left: 5,
          top: 0,
        )
      ],
    );
  }

  Widget _head() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getTwoRoundWidget(Colors.deepPurpleAccent,
            Colors.deepPurpleAccent, Colors.white, "N", true),
        SizedBox(
          width: 60,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Neellitoriya@gmail.com",
              style: TextStyle(
                  color: Colors.deepPurpleAccent, fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "blackworld.co.in",
              style: TextStyle(color: Colors.black, fontSize: 25),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sharing Center",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.deepPurpleAccent,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {}),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //两部分
            SizedBox(
              height: 50,
            ),
            _myWidge,
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 800,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Positioned(
                    child: Container(
                      width: 200,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(180)),
                      child: Align(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Icon(Icons.check, color: Colors.white,)),
                        alignment: Alignment.topCenter,),
                    ),
                    left: -50,
                    top: 0,
                  ),
                  Positioned(
                    child: Container(
                      width: 200,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(180)),
                      child: Align(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Icon(Icons.close, color: Colors.white,)),
                        alignment: Alignment.topCenter,),
                    ),
                    right: -50,
                    top: 0,
                  ),

                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40,
                    height: 800,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(240),
                            topRight: Radius.circular(240))),
                    child: Column(
                      children: <Widget>[

                        SizedBox(height: 50),
                        _getTwoRoundWidget(Colors.lightBlueAccent,
                            Colors.lightBlueAccent, Colors.white, "R", true),

                        SizedBox(height: 20,),
                        Text(
                          "Neellitoriya@gmail.com",
                          style: TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "blackworld.co.in",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        _twoRound(Colors.lightBlueAccent),


                        SizedBox(height: 50),
                        _getTwoRoundWidget(Colors.pinkAccent,
                            Colors.pinkAccent, Colors.white, "R", false),

                        SizedBox(height: 20,),
                        Text(
                          "Neellitoriya@gmail.com",
                          style: TextStyle(
                              color: Colors.black, fontSize: 25),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "blackworld.co.in",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                        _twoRound(Colors.pinkAccent),
                        SizedBox(
                          height:50,
                        ),
                        Text(
                          "More",
                          style: TextStyle(
                              color: Colors.black, fontSize: 35),
                        ),


                      ],


                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
