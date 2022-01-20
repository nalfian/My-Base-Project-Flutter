import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:flutter/material.dart';

class SafeAreaCustom extends StatelessWidget {
  final Widget child;
  final ThemeManager theme;

  const SafeAreaCustom({Key key, this.child, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [
          0.5,
          0.5
        ], colors: <Color>[
          theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
          theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white
        ])),
        child: SafeArea(child: child));
  }
}
