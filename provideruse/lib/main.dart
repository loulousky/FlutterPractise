import 'package:flutter/material.dart';
import 'dart:async';


/***
 *
 * 用dart的streamcontroller和flutter的 streambuild的形式代替手动的setstate(){}来构建
 * 和重绘需要更新的widget  需要导入  import 'dart:async';
 *
 *
 * 示例代码改用streambuilder的形式
 *
 * inheritwidget更新是不区分widget的，一但数据改变，全部widget都会更新。使用 streamBuild 结合inheritwidget可以改变
 *
 * streambuilder可以监听流的状态，根据状态返回响应的widget
 * switch (snapshot.connectionState) {
    case ConnectionState.none: return Text('Select lot');
    case ConnectionState.waiting: return Text('Awaiting bids...');
    case ConnectionState.active: return Text('\$${snapshot.data}');
    case ConnectionState.done: return Text('\$${snapshot.data} (closed)');
    }



   stream可以传递 任何东西都可以！包括简单的值，事件，对象，集合，map，error或者其他的Stream，任何类型的数据都可以使用Stream来传输。
 *
 *
 */
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
  int _counter = 0;
  StreamController<int> _controller=StreamController<int>();
  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {

    _controller.close();
    super.dispose();
  }

  void _incrementCounter() {
    //使用了stream 不需要再用setstate
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });


  _controller.add(_counter++);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
            //代替原来的纯文本
            StreamBuilder(builder: (context,state){
            if(state.hasData){   return   Text(
                '${state.data}',
                style: Theme.of(context).textTheme.display1,
              );}else{
              return Text(
                '没有数据',
                style: Theme.of(context).textTheme.display1,
              );

            }
            },initialData: _counter,stream:_controller.stream ,)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
