import 'package:avoria_liquids/models/menu.dart';
import 'package:flutter/material.dart';

class ItemsMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(child: new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Container(height: MediaQuery
            .of(context)
            .size
            .height * 0.7,
            padding: new EdgeInsets.only( top: MediaQuery
                .of(context)
                .size
                .height*0.05),
            child: new ListView.builder(
              itemExtent: 31.0,
              itemCount: Menu.menus.length,
              itemBuilder: (context, index) {
                return new FlatButton(onPressed: () {},
                    child: new Row(
                      children: <Widget>[
                        new Image.asset(Menu.menus[index].icon),
                        new Padding(padding: new EdgeInsets.only(left: 20.0),
                            child: new Text('${Menu.menus[index].name}',
                                style: new TextStyle(color: Colors.white))),
                      ],
                    )
                );
              },
            )),
        new Container(
          padding: new EdgeInsets.only(left: 10.0),
            height: 150.0,
            child: new ListView(
              itemExtent: 40.0,
              children: <Widget>[
                new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Image.asset("icons/offline_stores.png"),
                      new Padding(padding: new EdgeInsets.only(left: 20.0),
                          child: new Text(
                              "OFFLINE STORES",
                              style: new TextStyle(color: Colors.white),
                              softWrap: false))
                    ]),
                new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Image.asset("icons/service_hilfe.png"),
                      new Padding(padding: new EdgeInsets.only(left: 20.0),
                          child: new Text(
                              "SERVICE HILFE",
                              style: new TextStyle(color: Colors.white),
                              softWrap: false))
                    ]),

                new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Image.asset("icons/kontakt.png"),
                      new Padding(padding: new EdgeInsets.only(left: 20.0),
                          child: new Text(
                              "KONTAKT",
                              style: new TextStyle(color: Colors.white),
                              softWrap: false))
                    ])
              ],
            )),
      ],
    ));
  }
}