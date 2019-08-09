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

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  Color txtcolors = Color(0xff7D7516);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int choseCakeposition = 0;
  int cakecount=0;


  /**
   * 选择数量
   */

  void _chooseNumAdd(){

    setState(() {

      cakecount++;

    });
  }


  void _chooseNumReduce(){

    if(cakecount==0){
      return;
    }
    setState(() {

      cakecount--;

    });
  }
  /*
   选择重量
   */
  void _chooseCake(int postion) {
    setState(() {
      choseCakeposition = postion;
    });
  }

  Widget _chooseCakeContain(int postion) {
    if (postion == choseCakeposition) {
      return Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: widget.txtcolors,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              "${postion + 1}kg",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ));
    } else {
      return Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xff23212B),
              border: Border.all(
                color: widget.txtcolors,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              "${postion + 1}kg",
              style: TextStyle(color: widget.txtcolors, fontSize: 14),
            ),
          ));
    }
  }

  List<Widget> _stars(double score, bool half) {
    List<Widget> _widgets = List<Widget>();
    int totalscore = 5;

    for (int i = 0; i < totalscore; i++) {
      if (i < score) {
        _widgets.add(Icon(
          Icons.star,
          color: Colors.yellow,
        ));
      } else if (i == score) {
        if (half) {
          _widgets.add(Icon(
            Icons.star_half,
            color: Colors.yellow,
          ));
        } else {
          _widgets.add(Icon(
            Icons.star,
            color: Colors.yellow,
          ));
        }
      } else {
        _widgets.add(Icon(
          Icons.star_border,
          color: Colors.yellow,
        ));
      }
    }

    return _widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff23212B),
      appBar: AppBar(
        backgroundColor: Color(0xff23212B),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: <Widget>[
              Center(
                  child: Column(
                children: <Widget>[
                  Text(
                    "Fruits Cake",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Text(
                    "strawberry & kiwi special",
                    style: TextStyle(color: widget.txtcolors, fontSize: 14),
                  ),
                ],
              )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ListView.builder(
                    itemBuilder: (context, postion) {
                      return GestureDetector(
                        onTap: () {
                          _chooseCake(postion);
                        },
                        child: _chooseCakeContain(postion),
                      );
                    },
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Stack(
                  overflow: Overflow.visible,
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        "assets/images/cake.jpg",
                        width: 250,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _chooseNumAdd();
                              }),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: widget.txtcolors,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${cakecount}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                _chooseNumReduce();

                              }),
                        ],
                      ),
                      top: 10,
                      right: 0,
                    ),
                    Positioned(
                      child: Text(
                        "\$87.55",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      right: 20,
                      bottom: -10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff23212B),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(-2, -2),
                                blurRadius: 5,
                                spreadRadius: 3),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(2, 2),
                                blurRadius: 5,
                                spreadRadius: 3),
                          ]),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.fastfood,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "4 eggs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.business,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "2 tsp vanilla",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.filter_vintage,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "1 cup sugar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Container(
                      height: 80,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff23212B),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(-2, -2),
                                blurRadius: 2,
                                spreadRadius: 3),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(2, 2),
                                blurRadius: 2,
                                spreadRadius: 3),
                          ]),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.map,
                              color: Colors.white,
                              size: 60,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "DELIVERY",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Text(
                                  "45.Amerlands",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                Text(
                                  "Nr.Hamer Road,London",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            )
                          ],
                        ),
                      ))),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Rattings",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: _stars(4, true),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: RaisedButton(
                    onPressed: () {},
                    child: Padding(padding: EdgeInsets.symmetric(horizontal:55),child: Text(
                      "make order now",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),),
                    color: widget.txtcolors,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
