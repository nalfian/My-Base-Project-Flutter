import 'package:base_project/screen/history/history_screen.dart';
import 'package:base_project/screen/home_navigation.dart';
import 'package:base_project/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => SplashScreen());
      case HomeNavigation.routeName:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => HomeNavigation());
      case HistoryScreen.routeName:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => HistoryScreen());
      default:
        return MaterialPageRoute(settings: settings, builder: (BuildContext context) => SplashScreen());
    }
  }
}
