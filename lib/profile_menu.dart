import 'package:avoria_liquids/models/menu.dart';
import 'package:flutter/material.dart';
import 'package:avoria_liquids/widgets/dropdown.dart' as blueDropDown;

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.only(left: 45.0, top: MediaQuery
            .of(context)
            .size
            .height*0.1),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Image.asset("images/logo_profile.png"),
                new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Container(
                          width: 68.0,
                          height: 20.0,
                          child: new FlatButton(
                              onPressed: null,
                              child: new Text("LOGIN", style: new TextStyle(
                                  color: Theme
                                      .of(context)
                                      .primaryColor,
                                  fontSize: 10.0))
                          )
                      ),
                      new Container(
                          width: 110.0,
                          height: 20.0,
                          child: new FlatButton(
                              onPressed: null,
                              child: new Text("REGISTERIERUNG",
                                style: new TextStyle(fontSize: 9.0),))
                      )
                    ])
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0), child: new Row(
                children: <Widget>[
                  new blueDropDown.DropdownButtonHideUnderline(
                      child: new blueDropDown.DropdownButton<String>(
                        items: <String>[
                          'images/germany.png', 'images/euro.png']
                            .map((String value) {
                          return new blueDropDown.DropdownMenuItem(
                            value: value,
                            child: new Image.asset(value),
                          );
                        }).toList(),
                        value: 'images/germany.png',
                        onChanged: (String value) {},
                        style: new TextStyle(decoration: TextDecoration.none),)
                  ),
                  new Padding(padding: new EdgeInsets.only(left: 5.0), child:
                  new blueDropDown.DropdownButtonHideUnderline(
                      child: new blueDropDown.DropdownButton<String>(
                        items: <String>[
                          'images/euro.png', 'images/germany.png']
                            .map((String value) {
                          return new blueDropDown.DropdownMenuItem(
                            value: value,
                            child: new Image.asset(value),
                          );
                        }).toList(),
                        value: 'images/euro.png',
                        onChanged: (String value) {},
                        style: new TextStyle(decoration: TextDecoration.none),)
                  )
                  )
                ])
            ),
            new Padding(
                padding: new EdgeInsets.only(top: 20.0),
                child: new Row(children: <Widget>[
                  new Icon(Icons.favorite, color: Theme
                      .of(context)
                      .primaryColor, size: 16.0,),
                  new Padding(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: new Text(
                          "MERKZETTEL", style: new TextStyle(color: Theme
                          .of(context)
                          .primaryColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500))
                  )
                ])),

            new Padding(
                padding: new EdgeInsets.only(top: 20.0),
                child: new Row(children: <Widget>[
                  new Image.asset("icons/shopping_cart.png"),
                  new Padding(
                      padding: new EdgeInsets.only(left: 10.0),
                      child: new Text(
                          "0,00€", style: new TextStyle(color: Theme
                          .of(context)
                          .hintColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w200))
                  )
                ])),
            new Padding(
                padding: new EdgeInsets.only(top: 20.0),
                child: new Row(
                    children: <Widget>[
                      new Text(
                          "ZAHLUNG & VERSAND", style: new TextStyle(color: Theme
                          .of(context)
                          .primaryColor,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500))
                    ]
                )
            ),
            new Padding(
                padding: new EdgeInsets.only(top: 15.0),
                child: new Row(
                    children: <Widget>[new Column(
                        children: <Widget>[
                          new Text(
                              "VERSANDKOSTEN",
                              style: new TextStyle(color: Theme
                                  .of(context)
                                  .hintColor,
                                  fontSize: 9.0)),

                          new Padding(
                              padding: new EdgeInsets.only(top: 10.0),
                              child: new Text(
                                  "ZAHLUNGSAETEN",
                                  style: new TextStyle(color: Theme
                                      .of(context)
                                      .hintColor,
                                      fontSize: 9.0)))
                        ]
                    )
                    ])
            ),
            new Padding(
                padding: new EdgeInsets.only(top: 20.0),
                child: new Row(
                    children: <Widget>[
                      new Text(
                          "RECHTLICHES", style: new TextStyle(color: Theme
                          .of(context)
                          .primaryColor,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500))
                    ]
                )
            ),

            new Padding(
                padding: new EdgeInsets.only(top: 15.0),
                child: new Row(
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "IMPRESSIUM",
                              style: new TextStyle(color: Theme
                                  .of(context)
                                  .hintColor,
                                  fontSize: 9.0),),

                            new Padding(
                                padding: new EdgeInsets.only(top: 10.0),
                                child: new Text(
                                    "AGB",
                                    style: new TextStyle(color: Theme
                                        .of(context)
                                        .hintColor,
                                        fontSize: 9.0))),
                            new Padding(
                                padding: new EdgeInsets.only(top: 10.0),
                                child: new Text(
                                    "DATENSCHUTZ",
                                    style: new TextStyle(color: Theme
                                        .of(context)
                                        .hintColor,
                                        fontSize: 9.0))),
                            new Padding(
                                padding: new EdgeInsets.only(top: 10.0),
                                child: new Text(
                                    "WIDERRUFSBELEHRUG",
                                    style: new TextStyle(color: Theme
                                        .of(context)
                                        .hintColor,
                                        fontSize: 9.0))),
                          ]
                      )
                    ])
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0), child: new Row(
                children: <Widget>[
                  new Image.asset("images/phone.png"),
                  new Padding(padding: new EdgeInsets.only(left: 25.0, top: 4.0), child:
                  new Image.asset("images/email.png"),
                  )
                ])
            ),
          ],
        )
    );
  }
}