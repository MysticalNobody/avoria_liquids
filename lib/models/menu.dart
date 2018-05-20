import 'package:avoria_liquids/models/menu_item.dart';

class Menu {
  static final String bg = "images/bg_menu.png";
  static final List<MenuItem> menus = [
    new MenuItem(name: "E-LIQUID", icon: "icons/E-liquid.png", hasSubMenus: true),
    new MenuItem(name: "DEUTCH LIQUID BASEN", icon: "icons/E-liquid.png", hasSubMenus: true),
    new MenuItem(name: "AROMEN", icon: "icons/E-liquid.png", hasSubMenus: true),
    new MenuItem(name: "SHAKE & VAPE", icon: "icons/E-liquid.png",hasSubMenus: false),
    new MenuItem(name: "NIKOTIN-SHOT", icon: "icons/E-liquid.png",hasSubMenus: false),
    new MenuItem(name: "ZUSATZSTOFFE", icon: "icons/E-liquid.png",hasSubMenus: false),
    new MenuItem(name: "E-SHISHA", icon: "icons/E-liquid.png",hasSubMenus: false),
    new MenuItem(name: "MISCHZUBEHÖR", icon: "icons/E-liquid.png",hasSubMenus: true),
    new MenuItem(name: "ZUBEHÖR", icon: "icons/E-liquid.png", hasSubMenus: true),
    new MenuItem(name: "NEU IM SHOP", icon: "icons/E-liquid.png",hasSubMenus: false),
    new MenuItem(name: "SALE", icon: "icons/E-liquid.png", hasSubMenus: true),
    new MenuItem(name: "HARDWARE", icon: "icons/E-liquid.png", hasSubMenus: true),
  ];
}