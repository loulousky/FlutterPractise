import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logindemo/page/RadiuWideget.dart';
import 'package:logindemo/page/SocalWidget.dart';
import 'package:logindemo/page/loginWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              TextTheme(body2: TextStyle(decoration: TextDecoration.none))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void isRemember(bool e) {}

    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: SizedBox(
              width: 280,
              height: 200,
              child: Image.asset(
                "assets/image_01.png",
                fit: BoxFit.fitHeight,
              ),
            ),
            right: 0,
            top: 40,
          ),
          Positioned(
            child: Image.asset("assets/logo.png"),
            top: 40,
            left: 70,
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    loginWidget(),
                    Container(
                      margin: EdgeInsets.only(left: 60, top: 20, right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RadiuWideget(
                                chagecallback: isRemember,
                                isselect: false,
                              ),
                              Material(
                                  child: Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "remember me",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ))
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              print("点击");
                            },
                            highlightColor: Colors.blue.withOpacity(0.3),
                            splashColor: Colors.white.withOpacity(0.3),
                            child: Container(
                              child: Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              ),
                              padding: EdgeInsets.only(
                                  left: 30, right: 30, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  gradient: LinearGradient(colors: [
                                    Colors.cyanAccent,
                                    Colors.blue
                                  ])),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Divider(
                            color: Colors.grey,
                            height: 5,
                          ),
                          Text(
                            "Social Login",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        ],
                      ),
                      height: 50,
                      width: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SocalWidget(
                            color: [Colors.blue, Colors.red], img: Icons.face),
                        SocalWidget(
                            color: [Colors.yellow, Colors.orange],
                            img: Icons.face),
                        SocalWidget(
                            color: [Colors.pink, Colors.green], img: Icons.face)
                      ],
                    ),
                    Text.rich(TextSpan(text: "New user?", children: [
                      TextSpan(
                        text: "Signup",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                        recognizer: TapGestureRecognizer()..onTap=(){
                          print("去注册");
                        }
                      )
                    ]))
                  ],
                ),
              ),
            ),
            top: 170,
          )
        ],
      ),
    );
  }
}
