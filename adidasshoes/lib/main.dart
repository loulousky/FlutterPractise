import 'package:adidasshoes/ColorContianer.dart';
import 'package:flutter/material.dart';

import 'MyContainer.dart';

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
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isExpendDes = false;

  int choseSize = 0; //默认选择第一个

  int goodsnum = 1;

  int colorchose = 0;

  Widget _shopCar() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Align(alignment: AlignmentDirectional.centerStart,child:Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),),
              ),
            )),

        Positioned(child:  Image.asset("assets/cart.png"),right: -40,bottom: -40, )


      ],
    );
  }

  Widget _price() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Price",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "\$80",
              style: TextStyle(color: Colors.white, fontSize: 38),
            ),
          )
        ],
      ),
    );
  }

  Widget _choseColor() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Select Color",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              ColorContianer(Colors.red, (position) {
                setState(() {
                  colorchose = 0;
                });
              }, 0, colorchose),
              ColorContianer(Colors.yellow, (position) {
                setState(() {
                  colorchose = 1;
                });
              }, 1, colorchose),
              ColorContianer(Colors.grey, (position) {
                setState(() {
                  colorchose = 2;
                });
              }, 2, colorchose),
              ColorContianer(Colors.green, (position) {
                setState(() {
                  colorchose = 3;
                });
              }, 3, colorchose),
              ColorContianer(Colors.blue, (position) {
                setState(() {
                  colorchose = 4;
                });
              }, 4, colorchose),
            ],
          )
        ],
      ),
    );
  }

  Widget _middleWidgets() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Size",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _ChoseItem(),
              _Quantity(),
            ],
          )
        ],
      ),
    );
  }

  Widget _Quantity() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              if (goodsnum > 0) {
                goodsnum--;
              }
            });
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Color(0xFF696D77)),
            child: Text(
              "-",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.center,
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: Color(0xFF696D77)),
          child: Text(
            "$goodsnum",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              goodsnum++;
            });
          },
          child: Container(
            alignment: AlignmentDirectional.center,
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Color(0xFF696D77)),
            child: Text(
              "+",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ProductDes() {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Product Description",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text.rich(
              TextSpan(
                text:
                    "Adidas is one of the world’s top sporting brands. It is based in Germany and includes other brands like Reebok in its group."
                    " The three parallel bars that form its logo is known worldwide. The company bought these “Three Stripes” from a Finnish sports"
                    " company in the 1950s. Adidas has provided quality sporting goods for decades. They create a very strong brand loyalty among consumers."
                    " Many people wear Adidas clothes and shoes as a fashion statement.",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              maxLines: isExpendDes ? 10 : 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpendDes = !isExpendDes;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _sizeChose() {
    List<Widget> widgets = List<Widget>();
    widgets.add(MyContainer(0, choseSize, () {
      setState(() {
        choseSize = 0;
      });
    }, "7"));
    widgets.add(MyContainer(1, choseSize, () {
      setState(() {
        choseSize = 1;
      });
    }, "8"));
    widgets.add(MyContainer(2, choseSize, () {
      setState(() {
        choseSize = 2;
      });
    }, "9"));
    widgets.add(MyContainer(3, choseSize, () {
      setState(() {
        choseSize = 3;
      });
    }, "10"));

    return widgets;
  }

  Widget _ChoseItem() {
    return Row(
      children: _sizeChose(),
    );
  }

  Widget _RatingWdiget() {
    return Padding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Rating",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Text.rich(TextSpan(
                  text: "4.5",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                        text: "  [378 people]",
                        style: TextStyle(color: Colors.grey, fontSize: 12))
                  ]))
            ],
          )
        ],
      ),
      padding: EdgeInsets.only(left: 15, right: 15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.centerEnd)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Energy Cloud",
            style: TextStyle(color: Colors.white30),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset("assets/adidas.png"),
                Positioned(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black45),
                      child: Image.asset("assets/360.png"),
                    ),
                  ),
                  right: 50,
                  top: 80,
                )
              ],
            ),
            _RatingWdiget(),
            _ProductDes(),
            _middleWidgets(),
            _choseColor(),
            _price(),
            _shopCar(),
            SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
