import 'package:base_project/config/theme_manager.dart';
import 'package:base_project/screen/splash_screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart' as router;

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
    return FlutterWebFrame(
      builder: (context) {
        return Consumer<ThemeManager>(
            builder: (context, theme, child) => ScreenUtilInit(
                  designSize: Size(475, 812),
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
      },
      maximumSize: Size(475, 812),
      enabled: kIsWeb,
      backgroundColor: Colors.grey,
    );
  }
}
