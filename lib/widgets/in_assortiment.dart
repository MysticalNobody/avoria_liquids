import 'package:avoria_liquids/widgets/product_preview.dart';
import 'package:flutter/material.dart';

class InAssortiment extends StatelessWidget {
  const InAssortiment({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(title, style: new TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            fontWeight: FontWeight.w500, fontSize: 18.0)),
        new Padding(
            padding: new EdgeInsets.all(25.0),
            child: new Container(
                decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: const Color.fromRGBO(78, 78, 78, 0.2),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 4.0,
                  ),
                ]),
                child: new Container(
                    padding: new EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    color: Colors.white,
                    child: new Column(children: <Widget>[
                      new Padding(
                          padding: new EdgeInsets.only(left: 20.0),
                          child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new ProductPrev(name: "Captain Melons",
                                    img: "images/product/1.png",
                                    price: "1,99",
                                    perLiter: "995,00 € / 1 Liter",
                                    stars: 4),
                                new ProductPrev(
                                  name: "Captain Melons",
                                  img: "images/product/1.png",
                                  price: "1,99",
                                  perLiter: "995,00 € / 1 Liter",
                                  stars: 3,)

                              ])),
                      new Padding(
                          padding: new EdgeInsets.only(top: 20.0, left: 20.0),
                          child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new ProductPrev(name: "Captain Melons",
                                    img: "images/product/1.png",
                                    price: "1,99",
                                    perLiter: "995,00 € / 1 Liter",
                                    stars: 3),
                                new ProductPrev(
                                  name: "Captain Melons",
                                  img: "images/product/1.png",
                                  price: "1,99",
                                  perLiter: "995,00 € / 1 Liter",
                                  stars: 2,)
                              ])
                      )
                    ])
                )
            )
        )
      ],);
  }
}