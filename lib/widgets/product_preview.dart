import 'package:flutter/material.dart';

class ProductPrev extends StatelessWidget {
  const ProductPrev(
      {this.name, this.img, this.price, this.perLiter, this.stars});

  final String name;
  final String img;
  final String price;
  final String perLiter;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(name, style: new TextStyle(color: Theme
            .of(context)
            .primaryColor,
            fontSize: 13.0, fontWeight: FontWeight.w500),),
        new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),
            child: generateStars(stars)),
        new Image.asset(img, width: 120.0, fit: BoxFit.fitWidth,),
        new Padding(
            padding: new EdgeInsets.only(top: 10.0),
            child: new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Padding(
                      padding: new EdgeInsets.only(top: 5.0, right: 10.0),
                      child: new Text("ab ", style: new TextStyle(color: Theme
                          .of(context)
                          .hintColor, fontSize: 12.0))),
                  new Text(price, style: new TextStyle(color: Theme
                      .of(context)
                      .primaryColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700),),
                  new Padding(
                      padding: new EdgeInsets.only(top: 5.0, left: 10.0),
                      child: new Text(" €*", style: new TextStyle(color: Theme
                          .of(context)
                          .hintColor, fontSize: 12.0)))
                ])
        ),
        new Padding(padding: new EdgeInsets.only(top: 3.0),
            child: new Text(perLiter, style: new TextStyle(color: Theme
                .of(context)
                .hintColor, fontSize: 12.0),))
      ],
    );
  }
}

Widget generateStars(int rating) {
  List<Widget> stars = [];
  for (int i = 0; i < 5; i++) {
    stars.add(new Image.asset(
      i < rating ? "icons/star_active.png" : "icons/star_inactive.png",
      height: 10.0, fit: BoxFit.fitHeight,));
  }
  return new Row(children: stars, mainAxisAlignment: MainAxisAlignment.start,);
}