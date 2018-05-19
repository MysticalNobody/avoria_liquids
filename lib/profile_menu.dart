import 'package:avoria_liquids/models/menu.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: new EdgeInsets.only(left: 50.0, top: 75.0),
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
                          width: 70.0,
                          height: 20.0,
                          child: new FlatButton(
                              onPressed: null,
                              child: new Text("LOGIN", style: new TextStyle(
                                  color: const Color(0xFF1e56be),
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
          ],
        )
    );
  }
}