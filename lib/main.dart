import 'dart:html';

import 'package:base_project/config/theme_manager.dart';
import 'package:base_project/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart' as router;
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(ChangeNotifierProvider<ThemeManager>(
      create: (_) => new ThemeManager(),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => ScreenUtilInit(
              designSize: checkIsComputer() ? Size(1600, 900) : Size(375, 812),
              builder: () => MaterialApp(
                theme: theme.getTheme(),
                builder: (context, widget) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: widget,
                  );
                },
                debugShowCheckedModeBanner: false,
                initialRoute: SplashScreen.routeName,
                onGenerateRoute: (settings) => router.Router.generateRoute(settings),
              ),
            ));
  }

  bool checkIsComputer() {
    if (kIsWeb) return getOSInsideWeb() == 'computer';
    return false;
  }

  String getOSInsideWeb() {
    final userAgent = window.navigator.userAgent.toString().toLowerCase();
    if (userAgent.contains("iphone")) return "ios";
    if (userAgent.contains("ipad")) return "ios";
    if (userAgent.contains("android")) return "Android";
    return "computer";
  }
}
