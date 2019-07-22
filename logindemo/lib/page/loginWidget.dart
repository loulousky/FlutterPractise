import 'package:flutter/material.dart';

/// 创建时间：2019/7/19
/// 作者：admin
/// 描述：登陆页面的输入框

class loginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginState();
  }
}

class loginState extends State<loginWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 300,
      height: 200,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              blurRadius: 5,
              offset: Offset(2.0,2.0),
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.3)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: "Poppins-Bold"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "username",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "输入用户名",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        fillColor: Colors.blue,
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent)),
                        border: InputBorder.none),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 5),
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "password",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "输入密码",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurpleAccent)),
                        border: InputBorder.none),
                  )
                ],
              ),
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("forget password?",style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 8,decoration: TextDecoration.none),textAlign: TextAlign.right,)
            ],
          )



        ],
      ),
    );
  }
}
