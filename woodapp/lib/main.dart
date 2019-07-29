import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Container(

        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle
        ),
        child: Icon(Icons.add,color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark),title: SizedBox(),),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today,),title: SizedBox()),
      ],selectedItemColor: Colors.black),
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                  )),
            ],
          ),
          Positioned(
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            top: MediaQuery.of(context).padding.top,
            left: 15,
            right: 15,
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Wooden ArmChairs",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "xxxxxx",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            left: 30,
            right: 30,
            top: 120,
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView.builder(
              itemBuilder: (context, p) {
                return Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: p % 2 == 0 ? Colors.white : Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Chairs",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: p % 2 == 0 ? Colors.black : Colors.white,),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "xxxxxx",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "126\$",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              color: p % 2 == 0 ? Colors.black : Colors.white,),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),

                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.only(left: 30,right:30,top: 50),
                      width: 200,
                      height: 250,
                    ),
                    Container(child: Image.asset(
                      "assets/image_0${p + 1}.png",
                      width: 200,
                      height: 150,
                    ),)
                  ],
                );
              },
              itemCount: 3,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
