
import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:base_project/screen/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash-screen';

  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ThemeManager>(builder: (context, theme, child) => body(context, theme)));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    return Container(
      color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, HomeNavigation.routeName) ;
        },
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
            child: Text(
              'Base Project',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
