import 'package:flutter/material.dart';
import 'package:newsappclone/commons/theme/colors.dart';
class TabConstant {
  TabConstant._();
  static final TabConstant instance = TabConstant._();
  static TabCategory today = TabCategory(0, "Bugun", color: Colors.black45);
  static TabCategory news = TabCategory(1, "Gundem", color: Colors.red);
  static TabCategory economy =
  TabCategory(17, "Ekonomi", color: Colors.blueAccent);
  static TabCategory sports =
  TabCategory(25, "Spor", color: Colors.green);
  List<TabCategory> homeCategoryList = [
    today,
    news,
    sports,
    economy,
  ];
}
class TabCategory {
  final int id;
  final String name;
  final Color color;
  TabCategory(this.id, this.name,
      {this.color = ColorHelper.lightModeDarkColorDark6});
  bool operator ==(dynamic other) =>
      other != null && other is TabCategory && this.id == other.id;
  @override
  int get hashCode => super.hashCode;
}
class ContentType {
  final int id;
  final String name;
  final String linkName;
  ContentType(this.id, this.name, this.linkName);
}
