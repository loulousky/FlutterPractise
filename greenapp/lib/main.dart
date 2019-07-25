import 'package:flutter/material.dart';

import 'greendetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 25),
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black26),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Fiddle Leaf Fig",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Topiary",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              "10 num now",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              "\$85",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        
                        Container(
                          margin: EdgeInsets.only(left: 30,top: 100),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return greendetail();
                              }));
                              
                            },
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                            ),
                            
                          ),
                        ),
                        Image.network(
                          "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1564630576&di=b35b4ea9205aa90976ea0b38ea07f467&imgtype=jpg&er=1&src=http%3A%2F%2Fpic.66zhuang.com%2Fzxrj%2Fpics%2Fimage%2F2015-02-04%2F2a584055c66f2188f52a6166642177e5.jpg",
                          height: 250,
                          width: 200,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[

                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: Colors.lightGreen.withOpacity(0.5),
                    ),

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(TextSpan(text: "250",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),children: [
                          TextSpan(text: "m",style:TextStyle(color: Colors.white,fontSize: 12) )
                        ]),style: TextStyle(wordSpacing: 10),),
                        SizedBox(height:10),
                        Text("######",style: TextStyle(color: Colors.white,fontSize: 14),)
                      ],
                      
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      color: Colors.lightGreen.withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(TextSpan(text: "25",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),children: [
                          TextSpan(text: "c",style:TextStyle(color: Colors.white,fontSize: 12) )
                        ]),style: TextStyle(wordSpacing: 10),),
                        SizedBox(height:10),
                        Text("######",style: TextStyle(color: Colors.white,fontSize: 14),)
                      ],

                    ),
                  ),

                ],




              ),
            )
          ],
        ));
  }
}
