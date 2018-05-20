import 'package:flutter/material.dart';

class ImageCart extends StatelessWidget {
  const ImageCart({this.imgPath, this.btnText});

  final String imgPath;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Image.asset(imgPath, fit: BoxFit.fitWidth, height: MediaQuery
            .of(context)
            .size
            .width,),
        new Padding(
            padding: new EdgeInsets.only(top: 20.0),
            child: new Container(
                decoration: new BoxDecoration(
                    border: new Border.all(
                        color: Colors.blueAccent)
                ),
                child: new FlatButton(
                    onPressed: () {},
                    child: new Text(btnText,
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
        )
      ],
    );
  }
}