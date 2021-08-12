import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../ui/views/bottomnavigation/main_navigation_view.dart';
class Routes {
  static const String mainView = '/';
  static const all = <String>{
    mainView,
  };
}
class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.mainView, page: MainView),
  ];
  // @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
  };
}