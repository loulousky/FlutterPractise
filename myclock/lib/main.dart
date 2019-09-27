import 'dart:async';
import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:myclock/clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _second;
  int _minute;
  int _hour;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
          child: new CustomPaint(
              painter: Clock(_second, _minute, _hour), size: Size(500, 500)),
          onTap: () {},
        ),
      ),
    );
  }

  @override
  void initState() {
    _timer= new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        DateTime time = DateTime.now();
        _second = time.second;
        _minute = time.minute;
        _hour = time.hour;

        print("当前的时 分 秒 ${_hour} ${_minute} ${_second}");
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


}
