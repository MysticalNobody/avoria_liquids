import 'package:avoria_liquids/profile_menu.dart';
import 'package:avoria_liquids/models/menu.dart';
import 'package:avoria_liquids/models/profile.dart';
import 'package:avoria_liquids/items_menu.dart';
import 'package:avoria_liquids/widgets/main_image_cart.dart';
import 'package:avoria_liquids/widgets/residemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Avoria_liquids',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF1e56be),
          hintColor: const Color(0xFF9ca0b4)
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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MenuController _menuController;

  //String bg = "images/bg_profile.png";
  bool changed = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ResideMenu.custom(
            direction: ScrollDirection.BOTH,
            controller: _menuController,
            rightView: new ItemsMenu(),
            leftView: new ProfileMenu(),
            child: new Scaffold(
                appBar: new AppBar(
                  backgroundColor: const Color(0xFFffffff),
                  actions: <Widget>[
                    new GestureDetector(
                      child: new Padding(
                          padding: new EdgeInsets.symmetric(horizontal: 15.0),
                          child: const Icon(
                            Icons.search, color: const Color(0xFF1e56be),)),
                      onTap: () {},
                    ),
                    new GestureDetector(
                      child: new Padding(
                          padding: new EdgeInsets.symmetric(horizontal: 15.0),
                          child: const Icon(
                              Icons.person, color: const Color(0xFF1e56be))),
                      onTap: () {
                        _menuController.openMenu(true);
                      },
                    ),
                    new GestureDetector(
                        child: new Padding(
                            padding: new EdgeInsets.symmetric(horizontal: 15.0),
                            child: const Icon(
                                Icons.menu, color: const Color(0xFF1e56be))),
                        onTap: () {
                          _menuController.openMenu(false);
                        }
                    )
                  ],
                  title: new Image.asset(
                    "images/logo.png", fit: BoxFit.contain, width: 65.0,),
                ),
                body: new SingleChildScrollView(
                    child: new Container(
                        color: Colors.white,
                        child: new Column(
                            children: <Widget>[
                              new Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                height: 38.0,
                                color: Colors.black,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Image.asset("icons/car.png"),
                                    new Padding(
                                        padding: new EdgeInsets.only(
                                            left: 20.0),
                                        child: new Text(
                                            "Kostenfreie Lieferung ab 39€ innerhalb DE",
                                            style: new TextStyle(
                                                color: Colors.white))),
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
                                        new Image.asset(
                                          "images/slider/1.png",
                                          fit: BoxFit.fitWidth,),
                                        new Image.asset(
                                            "images/slider/2.png",
                                            fit: BoxFit.fitWidth),
                                      ]
                                  )
                              ),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 45.0),
                                  child: new Text(
                                      "DEAL DES TAGES", style: new TextStyle(
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                      fontWeight: FontWeight.w500))),
                              new Image.asset(
                                "images/main/1.png", fit: BoxFit.fitWidth,),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 5.0),
                                  child: new Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: <Widget>[
                                        new Image.asset("icons/timer.png"),
                                        new Padding(
                                            padding: new EdgeInsets.only(
                                                left: 15.0),
                                            child: new Text(
                                                "05:16:01h",
                                                style: new TextStyle(
                                                    color: const Color(
                                                        0xFFff3366),
                                                    fontSize: 13.0)
                                            )
                                        ),
                                        new Padding(
                                            padding: new EdgeInsets.only(
                                                left: 20.0),
                                            child: new Container(
                                                padding: new EdgeInsets
                                                    .symmetric(horizontal: 7.0,
                                                    vertical: 3.0),
                                                color: const Color(
                                                    0xFFff3366),
                                                child: new Text("-43%",
                                                    style: new TextStyle(
                                                        color: Colors.white)
                                                )
                                            )
                                        )
                                      ]
                                  )
                              ),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 25.0),
                                  child: new Container(
                                      decoration: new BoxDecoration(
                                          border: new Border.all(
                                              color: Colors.blueAccent)
                                      ),
                                      child: new FlatButton(
                                          onPressed: () {},
                                          child: new Text("ANGEBOT SICHERN",
                                              style: new TextStyle(
                                                  color: Theme
                                                      .of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18.0,
                                                  letterSpacing: 4.0)
                                          )
                                      )
                                  )
                              ),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 55.0),
                                  child: new ImageCart(
                                      imgPath: "images/main/2.png",
                                      btnText: "NEU IM SHOP")),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 30.0),
                                  child: new ImageCart(
                                      imgPath: "images/main/3.png",
                                      btnText: "HÄNDLER WERDEN B2B")),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 30.0),
                                  child: new ImageCart(
                                      imgPath: "images/main/4.png",
                                      btnText: "NICSHOTS")),
                              new Padding(
                                  padding: new EdgeInsets.only(top: 30.0),
                                  child: new ImageCart(
                                      imgPath: "images/main/5.png",
                                      btnText: "OFFLINE STORES")),

                            ]
                        )
                    )
                )
            )
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(vsync: this);
  }
}
