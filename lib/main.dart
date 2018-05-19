import 'package:avoria_liquids/profile_menu.dart';
import 'package:avoria_liquids/models/menu.dart';
import 'package:avoria_liquids/models/profile.dart';
import 'package:avoria_liquids/items_menu.dart';
import 'package:flutter/material.dart';
import 'package:residemenu/residemenu.dart';
import 'package:carousel_slider/carousel_slider.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Avoria_liquids',
      theme: new ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: new MyHomePage(title: 'Avoria_liquids'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuController _menuController;
  String bg = "images/bg_profile.png";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ResideMenu(
            direction: ScrollDirection.BOTH,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(bg),
                    fit: BoxFit.cover)),
            controller: _menuController,
            rightView: new ItemsMenu(),
            leftView: new ProfileMenu(),
            child: new Scaffold(
                appBar: new AppBar(
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    new GestureDetector(
                      child: new Padding(
                          padding: new EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.search, color: Colors.blue,)),
                      onTap: () {},
                    ),
                    new GestureDetector(
                      child: new Padding(
                          padding: new EdgeInsets.symmetric(horizontal: 10.0),
                          child: const Icon(Icons.person, color: Colors.blue)),
                      onTap: () {
                        _menuController.openMenu(true);
                      },
                    ),
                    new GestureDetector(
                        child: new Padding(
                            padding: new EdgeInsets.symmetric(horizontal: 10.0),
                            child: const Icon(Icons.menu, color: Colors.blue)),
                        onTap: () {
                          _menuController.openMenu(false);
                        }
                    )
                  ],
                  title: new Image.asset(
                    "images/logo.png", fit: BoxFit.contain, width: 65.0,),
                ),
                body: new SingleChildScrollView(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 38.0,
                        color: Colors.black,
                        child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                          new Image.asset("icons/car.png"),
                          new Padding(padding: new EdgeInsets.only(left: 20.0),
                              child: new Text("Kostenfreie Lieferung ab 39€ innerhalb DE",
                                  style: new TextStyle(color: Colors.white))),
                        ],),
                      ),
                      new Container(
                        height: 300.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: new PageView(
                          children: <Widget>[
                            new Image.asset("images/slider/1.png",fit: BoxFit.fitWidth,),
                            new Image.asset("images/slider/2.png",fit: BoxFit.fitWidth),
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(
        listener: new MenuListener(
            onClose: () {
//          print("closed");

            }
            ,
            onOpen: (bool left) {},
            onOffsetChange: (double offset) {
              setState(() {
                bg = offset > 0 ? Profile.bg
                    : Menu.bg; //Если offset >  0, то левое меню, если < 0 то правое
              });
            }
        )
    );
  }
}
