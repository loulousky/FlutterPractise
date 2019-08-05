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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.message,
            color: Colors.black,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "http://b-ssl.duitang.com/uploads/item/201805/13/20180513224039_tgfwu.png"),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: <Widget>[
                    Text("Damodar Lohani"),
                    Text(
                      "Full Stack Develo",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Damodar Lohani",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SKILLS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(

                    child:  Text(
                      "WORDPRESS",
                      style: TextStyle(color: Colors.grey),
                    ),
                        flex: 1,
                  ),

                      Expanded(
                        flex: 2,
                          child: SizedBox(
                        height: 15,
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: Colors.indigo.withOpacity(0.3),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "LARAVEL",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 15,
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: Colors.indigo.withOpacity(0.3),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "REACT JS",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 15,
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: Colors.indigo.withOpacity(0.3),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "FLUTTER",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 15,
                        width: double.infinity,
                        child: LinearProgressIndicator(
                          value: 0.8,
                          backgroundColor: Colors.indigo.withOpacity(0.3),
                        ),
                      )),
                    ],
                  ),
                )
              ],
            ),

            SizedBox(
              height: 15,
            ),
            //经验
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "EXPERIENCE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),

                      SizedBox(width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("xxxxxx",style: TextStyle(fontSize: 18),),
                          Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",style: TextStyle(color: Colors.grey),)
                        ],
                        
                      )

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),

                      SizedBox(width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("xxxxxx",style: TextStyle(fontSize: 18),),
                          Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",style: TextStyle(color: Colors.grey),)
                        ],

                      )

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),

                      SizedBox(width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("xxxxxx",style: TextStyle(fontSize: 18),),
                          Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",style: TextStyle(color: Colors.grey),)
                        ],

                      )

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),

                      SizedBox(width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("xxxxxx",style: TextStyle(fontSize: 18),),
                          Text("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",style: TextStyle(color: Colors.grey),)
                        ],

                      )

                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
