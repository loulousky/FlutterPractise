import 'dart:ui';
import 'dart:ui' as prefix1;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UserCenter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Provider<String>.value(
          value: "aaa",
          child: MyHomePage(),
        ));
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
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(
        title: Text("首页",style: prefix0.TextStyle(color: Colors.black),),
        icon:  Icon(Icons.home,color: Colors.grey,size: 40,),
        activeIcon: Icon(Icons.home,color: Colors.green,size: 40,)
      ),BottomNavigationBarItem(
          title: Text("发布",style: prefix0.TextStyle(color: Colors.black)),
          icon:  Icon(Icons.airplanemode_active,color: Colors.grey,size: 40,),
          activeIcon: Icon(Icons.airplanemode_active,color: Colors.green,size: 40,)
      ),BottomNavigationBarItem(
          title: Text("商城",style: prefix0.TextStyle(color: Colors.black)),
          icon:  Icon(Icons.child_friendly,color: Colors.grey,size: 40,),
          activeIcon: Icon(Icons.child_friendly,color: Colors.green,size: 40,)
      ),BottomNavigationBarItem(

          title: Text("我的",style: prefix0.TextStyle(color: Colors.black)),
          icon:  Icon(Icons.perm_identity,color: Colors.grey,size: 40,),
          activeIcon: Icon(Icons.perm_identity,color: Colors.green,size: 40,)
      )],currentIndex: 3,unselectedItemColor: Colors.grey,showUnselectedLabels: true,iconSize: 40,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Column(

                  children: <Widget>[
                    Container(
                      height: 180,
                      color: Colors.amber,
                    ),

                    SizedBox(height: 60,)
                  ],

                ),

                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 120,
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              iconSize: 36,
                              icon: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                          IconButton(
                              iconSize: 36,
                              icon: Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),left: 0,right: 0,top: 140,
                )
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Tom",style: TextStyle(color: Colors.green,fontSize: 20),),
                SizedBox(height: 10,),
                Text("Lv.17",style: TextStyle(color: Colors.green,fontSize: 18),)
              ],
            ),

            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("粉丝  1.5k",style: TextStyle(color: Colors.black,fontSize: 20),),
                SizedBox(width: 20,),
                Text("关注  36",style: TextStyle(color: Colors.black,fontSize: 18),)
              ],
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("288",style: TextStyle(color: Colors.black,fontSize: 25),),
                    Text("发布",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("288",style: TextStyle(color: Colors.black,fontSize: 25),),
                    Text("发布",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("288",style: TextStyle(color: Colors.black,fontSize: 25),),
                    Text("发布",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
              ],
            ),

            SizedBox(height: 10,),
            Container(height: 10,color: Colors.grey.withOpacity(0.1),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(width: 50,height: 50,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,

                    )),
                    Text("购物车",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(width: 50,height: 50,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,

                    ),),
                    Text("我的订单",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,

                    ),width: 50,height: 50,),
                    Text("地址管理",style: TextStyle(color: Colors.grey,fontSize: 18),)
                  ],
                ),
              ],
            ),

            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),child:Column(
              children: <Widget>[

                ListTile(leading: Icon(Icons.fastfood,color: Colors.green,size: 30,),title: Text("我的等级"),),

                ListTile(leading: Icon(Icons.money_off,color: Colors.green,size: 30),title: Text("我的M币"),),

                ListTile(leading: Icon(Icons.camera_roll,color: Colors.green,size: 30),title: Text("我的优惠券"),),





              ],
            )
              ,)

          ],
        ),
      ),
    );
  }
}
