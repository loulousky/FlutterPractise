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

  bool _directionleft=false;
  double distance=0;
  List<String> imgs;



  //切换图片
  List<String> _changeimgs(){

    List<String> array= imgs;

    String head=array.removeAt(0);

    array.add(head);


    return array;

  }

  List<String> _imgs(){

   List<String> array= List<String>();
   array.add("assets/1.png");
   array.add("assets/2.png");
   array.add("assets/3.png");

   return array;

  }
  List<Widget> _images() {
    List<Widget> images = List<Widget>();

    images.add(
        GestureDetector(
            child:Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80),
                  Stack(
                    overflow: Overflow.visible,
                    alignment: AlignmentDirectional.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          imgs[2],
                          fit: BoxFit.cover,
                          width: 160,
                          height: 180,
                        ),
                      ),
                      Positioned(
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Text(
                              "3.7 m away",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        top: -10,
                        right: 0,
                        left: 0,
                      )
                    ],
                  )
                ],
              ),
            )
        )
    );

    images.add(
      Center(
          child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Stack(
            overflow: Overflow.visible,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  imgs[1],
                  fit: BoxFit.cover,
                  width: 180,
                  height: 200,
                ),
              ),
              Positioned(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      "3.7 m away",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                top: -10,
                right: 0,
                left: 0,
              )
            ],
          )
        ],
      )),
    );
    images.add(  GestureDetector(
      onHorizontalDragUpdate: (d){
        setState(() {
          distance=distance+10;
          if(d.delta.dx<0){

            _directionleft=false;
          }else{
            _directionleft=true;
          }
        });
      },
      onHorizontalDragEnd: (d){
        setState(() {
          if(distance>100){
            //切换下一张
           imgs= _changeimgs();
           distance=0;
          }else{
            distance=0;
          }
        });
      },
      onHorizontalDragCancel: (){
        setState(() {
          distance=0;

        });

      },


      child:Container(
        margin: _directionleft==true?EdgeInsets.only(left: distance):EdgeInsets.only(right: distance),
        child:Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 0),
                Stack(
                  overflow: Overflow.visible,
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        imgs[0],
                        fit: BoxFit.cover,
                        width: 200,
                        height: 220,
                      ),
                    ),
                    Positioned(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            "3.7 m away",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      top: -10,
                      right: 0,
                      left: 0,
                    )
                  ],
                )
              ],
            ))

      ) ,

    ));

    return images;
  }

  @override
  void initState() {
    imgs=_imgs();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.pink, Colors.orange]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(120),
                    bottomRight: Radius.circular(120))),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "Date mate",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  overflow: Overflow.visible,
                  children: _images(),
                ),

                SizedBox(height: 10,),
                Text("Sasha-22",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.add_location,color: Colors.grey,),
                  Text("china",style: TextStyle(fontSize: 16,color: Colors.grey),),
                ],),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.face,color: Colors.grey,),
                    SizedBox(width: 10,),
                    Icon(Icons.face,color: Colors.grey,),
                    SizedBox(width: 10,),
                    Icon(Icons.face,color: Colors.grey,),
                  ],),
                SizedBox(height: 30,),
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 20,right: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.pink,Colors.orange]),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),

                              IconButton(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),

                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),

                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        ],


                      ),
                    ),

                    Positioned(child: Center(

                      child: Container(
                        decoration:BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: Colors.black26,offset: Offset(10,-10),blurRadius: 5)]
                        ),

                        child:   IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.pink,
                            ),
                            onPressed: () {}),

                      ),

                    ),top: -20,left: 0,right: 0,)



                  ],


                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
