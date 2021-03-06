import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_config.dart';

class ThemeManager with ChangeNotifier {
  static const String themeMode = "themeMode";

  final darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.grey,
    primaryColor: ColorConfig.darkPrimary,
    brightness: Brightness.dark,
    backgroundColor: ColorConfig.backgroundDark,
    scaffoldBackgroundColor: ColorConfig.backgroundDark,
    accentColor: Colors.white,
    unselectedWidgetColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.grey,
    primaryColor: ColorConfig.lightPrimary,
    brightness: Brightness.light,
    unselectedWidgetColor: Colors.white,
    backgroundColor: ColorConfig.backgroundLight,
    scaffoldBackgroundColor: ColorConfig.backgroundLight,
    accentColor: ColorConfig.accent,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  ThemeData _themeData;

  ThemeData getTheme() => _themeData;

  ThemeState _themeState;

  ThemeState getThemeState() => _themeState;

  ThemeManager() {
    SchedulerBinding.instance?.window?.onPlatformBrightnessChanged = () {
      final isDark = SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
      print('Dark ' + isDark.toString());
      setDefaultTheme();
    };
    setDefaultTheme();
  }

  void setDefaultTheme() {
    bool isDarkMode = SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
    _themeState = isDarkMode ? ThemeState.dark : ThemeState.light;
    _themeData = isDarkMode ? darkTheme : lightTheme;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDarkMode ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
    ));
    notifyListeners();
  }

  void setTheme(ThemeState theme) {
    _themeState = theme;
    _themeData = theme == ThemeState.dark ? darkTheme : lightTheme;
    notifyListeners();
  }
}

enum ThemeState { dark, light }
