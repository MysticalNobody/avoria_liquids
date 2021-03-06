/**
 * Author: Jpeng
 * Email: peng8350@gmail.com
 * createTime: 2018-5-9 21:13
 */

library residemenu;

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef void OnOpen(bool isLeft);
typedef void OnClose();
typedef void OnOffsetChange(double offset);

enum ScrollDirection { LEFT, RIGHT, BOTH }

class ResideMenu extends StatefulWidget {
  // your content View
  final Widget child;

  final ScrollDirection direction;

  //left or right Menu View
  final Widget leftView, rightView;

  //shadow elevation
  final double elevation;

  // it will control the menu Action,such as openMenu,closeMenu
  MenuController controller;

  // used to set bottom bg and color
  BoxDecoration decoration;

  final OnOpen onOpen;

  final OnClose onClose;

  final OnOffsetChange onOffsetChange;

  ResideMenu.scafford({@required this.child,
    Widget leftBuilder,
    MenuScaffold leftScaffold,
    MenuScaffold rightScaffold,
    this.decoration: const BoxDecoration(),
    this.direction: ScrollDirection.LEFT,
    this.elevation: 12.0,
    this.onOpen,
    this.onClose,
    this.onOffsetChange,
    this.controller,
    Key key})
      : assert(child != null),
        leftView = leftScaffold,
        rightView = rightScaffold,
        super(key: key);

  ResideMenu.custom({@required this.child,
    this.leftView,
    this.rightView,
    this.decoration: const BoxDecoration(color: const Color(0xff0000)),
    this.direction: ScrollDirection.LEFT,
    this.elevation: 12.0,
    this.onOpen,
    this.onClose,
    this.onOffsetChange,
    this.controller,
    Key key})
      : assert(child != null),
        super(key: key);

  @override
  _ResideMenuState createState() => new _ResideMenuState();
}

class _ResideMenuState extends State<ResideMenu> with TickerProviderStateMixin {
  // the last move point
  double _lastRawX = 0.0;

  //determine width
  double _width = 0.0;

  //check if user scroll left,or is Right
  bool _isLeft = true;

  // this will controll ContainerAnimation
  AnimationController _menuController;

  void _onScrollStart(DragStartDetails details) {/*
    _lastRawX = details.globalPosition.dx;*/
  }

  void _onScrollMove(DragUpdateDetails details) {/*
    double offset = (details.globalPosition.dx - _lastRawX) / _width * 2.0;
    widget.controller.value += BezierBlend(offset);
    _lastRawX = details.globalPosition.dx;

    if (widget.controller.value > 0) {
      widget.decoration = new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/bg_profile.png"),
              fit: BoxFit.cover));
    }
    else {
      widget.decoration = new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/bg_menu.png"),
              fit: BoxFit.cover));
    }*/
  }
/*
  double BezierBlend(double t) {
      return (t * t * t * (4 - 2 * t));
  }*/

  void _onScrollEnd(DragEndDetails details) {/*
    if (widget.controller.value > 0.005 && widget.controller.value < 0.45||
        widget.controller.value > 0.995 && widget.controller.value < 1) {
      widget.controller.openMenu(true);
    } else
    if (widget.controller.value < -0.005 && widget.controller.value > -0.45 ||
        widget.controller.value < -0.995 && widget.controller.value > -1) {
      widget.controller.openMenu(false);
    } else {
      widget.controller.closeMenu();
    }*/
    _lastRawX = 0.0;
  }

  void _changeState(bool left) {
    if (left) {
      widget.decoration = new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/bg_profile.png"),
              fit: BoxFit.cover));
    }
    else {
      widget.decoration = new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("images/bg_menu.png"),
              fit: BoxFit.cover));
    }

    if (_isLeft != left) {
      setState(() {
        _isLeft = left;
      });
    }
  }

  void _init() {
    _menuController =
    new AnimationController(vsync: this, lowerBound: 1.0, upperBound: 2.0);
    if (widget.controller == null)
      widget.controller = new MenuController(
        vsync: this,
      );
    widget.controller
      ..addListener(() {
        if (widget.controller.value > 0.0) {
          _changeState(true);
        } else {
          _changeState(false);
        }
      })..addListener(() {
      _menuController.value = 2.0 - widget.controller.value.abs();
      if (widget.onOffsetChange != null) {
        widget.onOffsetChange(widget.controller.value.abs());
      }
    })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (widget.controller.isOpenLeft) {
            if (widget.onOpen != null) {
              widget.onOpen(true);
            }
          } else if (widget.controller.isOpenRight) {
            if (widget.onOpen != null) {
              widget.onOpen(false);
            }
          } else {
            if (widget.onClose != null) {
              widget.onClose();
            }
          }
        }
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    _init();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _menuController.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(ResideMenu oldWidget) {
    // TODO: implement didUpdateWidget
    widget.controller = oldWidget.controller;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: (context, cons) {
      _width = cons.biggest.width;
      return new GestureDetector(
        onHorizontalDragStart: _onScrollStart,
        onHorizontalDragUpdate: _onScrollMove,
        onHorizontalDragEnd: _onScrollEnd,
        child: new Stack(
          children: <Widget>[
            new Container(
              decoration: widget.decoration,
            ),
            new _MenuTransition(
              valueControll: _menuController,
              child: new Container(
                  margin: new EdgeInsets.only(
                      left: (!_isLeft ? cons.biggest.width * 0.3 : 0.0),
                      right: (_isLeft ? cons.biggest.width * 0.3 : 0.0)),
                  child: _isLeft ? widget.leftView : widget.rightView
              ),
            ),
            new GestureDetector(
              onTap: () {
                widget.controller.closeMenu();
              },
              child: new _ContentTransition(
                  child: new Container(
                    child: widget.child,
                    decoration: new BoxDecoration(boxShadow: <BoxShadow>[
                      new BoxShadow(
                        color: const Color(0x78ccccff),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 16.0,
                      ),
                    ]),
                  ),
                  menuOffset: widget.controller),
            )
          ],
        ),
      );
    });
  }
}

class ResideMenuItem extends StatelessWidget {
  final String title;

  final TextStyle titleStyle;

  final Widget icon, right;

  final double height;

  final double midSpacing, leftSpacing, rightSpacing;


  const ResideMenuItem({Key key,
    this.title: "菜单物品",
    this.titleStyle: const TextStyle(
        inherit: true, color: const Color(0xffdddddd), fontSize: 15.0),
    this.icon: const Text(""),
    this.right: const Text(""),
    this.height: 50.0,
    this.leftSpacing: 40.0,
    this.rightSpacing: 50.0,
    this.midSpacing: 30.0});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        height: 40.0,
        alignment: Alignment.topRight,
        child: new Row(
          children: <Widget>[
            new Container(width: leftSpacing),
            icon,
            new Container(
              width: midSpacing,
            ),
            new Text(title, style: titleStyle),
            new Container(
              width: rightSpacing,
            ),
            right
          ],
        ));
  }
}

class _MenuTransition extends AnimatedWidget {
  final Widget child;

  _MenuTransition({@required this.child,
    @required Animation<double> valueControll,
    Key key})
      : super(key: key, listenable: valueControll);

  Animation<double> get valueControll => listenable;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new LayoutBuilder(builder: (context, cons) {
      double width = cons.biggest.width;
      double height = cons.biggest.height;
      final Matrix4 transform = new Matrix4.identity()
        ..scale(1.0, 1.0, 1.0);
      return new Opacity(
        opacity: 1.0,
        child: new Transform(
            transform: transform,
            child: child,
            origin: new Offset(width / 2, height / 2)),
      );
    });
  }
}

class _ContentTransition extends AnimatedWidget {
  final Widget child;

  _ContentTransition(
      {@required this.child, @required Animation<double> menuOffset, Key key})
      : super(key: key, listenable: menuOffset);

  Animation<double> get menuOffset => listenable;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new LayoutBuilder(builder: (context, cons) {
      double width = cons.biggest.width;
      double height = cons.biggest.height;
      double val = menuOffset.value;
      final Matrix4 transform = new Matrix4.identity()
        ..scale(1.0 - 0.25 * val.abs(), 1 - 0.15 * val.abs(), 1.0)
        ..translate(val * 0.95 * width);
      ;
      return new Transform(
          transform: transform,
          child: child,
          origin: new Offset(width / 2, height / 2));
    });
  }
}

class MenuController extends AnimationController {
  MenuController({TickerProvider vsync})
      : super(
      vsync: vsync,
      lowerBound: -1.0,
      duration: const Duration(milliseconds: 300),
      value: 0.0);

  void openMenu(bool left) {
    animateTo(left ? 1.0 : -1.0);
//    animateTo(left ? 1.0 : -1.0);
  }

  void closeMenu() {
    animateTo(0.0);
  }

  bool get isOpenLeft => value == 1.0;

  bool get isOpenRight => value == -1.0;

  bool get isClose => value == 0.0;
}

class MenuScaffold extends StatelessWidget {
  final List<Widget> children;
  final Widget header;
  final Widget footer;
  final double itemExtent;
  final double topMargin;

  MenuScaffold({Key key,
    @required this.children,
    this.topMargin: 100.0,
    Widget header,
    Widget footer,
    this.itemExtent: 40.0})
      : assert(children != null),
        header = header ?? new Container(height: 20.0),
        footer = footer ?? new Container(height: 20.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(top: this.topMargin),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          header,
          new Column(
            children: children,
          ),
          footer
        ],
      ),
    );
  }
}