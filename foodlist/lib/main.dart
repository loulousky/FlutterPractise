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

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _getFoodsBigorSmall(bool isbig) {
    return Container(
      width: double.infinity,
      height: isbig ? 350 : 300,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: isbig
                            ? AssetImage(
                                "assets/recipe01.png",
                              )
                            : AssetImage(
                                "assets/recipe02.png",
                              ),
                        fit: BoxFit.cover),
                    color: Colors.blue),
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: isbig ? 210 : 180,
                height: isbig ? 280 : 240,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "FRENCH",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "TOAST",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              )
            ],
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.pink],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
      child: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              width: 400,
              height: 800,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20))),
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20))),
            ),
            SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 50,
                              ),
                              onPressed: () {}),
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Your customised",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "BREAKFAST",
                                style: TextStyle(color: Colors.white, fontSize: 28),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                height: 50,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: Colors.white, width: 1.0),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.deepOrangeAccent,
                                ),
                                child: Center(
                                  child: Text(
                                    "FILTER",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                      child: Text(
                        "MY FAVORITES",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                    _getFoodsBigorSmall(false),
                    _getFoodsBigorSmall(true),
                    _getFoodsBigorSmall(true),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )),

            //底部
            Positioned(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(200),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search your recipe",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
              ),
              bottom: 0,
              left: 0,
              right: 0,
            )
          ],
        ),
      ),

      ),
    );
  }
}
