import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:base_project/screen/activity/activity_screen.dart';
import 'package:base_project/screen/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeNavigation extends StatefulWidget {
  static const String routeName = '/home-navigation';

  const HomeNavigation({Key key}) : super(key: key);

  @override
  _HomeNavigationState createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> with SingleTickerProviderStateMixin {
  ScrollController controller;
  ScrollController controller2;
  bool isHideNavBotBar = false;
  AnimationController animationController;
  int _selectedIndex = 0;

  static List<Widget> _pages = [];

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controller = ScrollController();
    controller2 = ScrollController();
    controller.addListener(() {
      isHideNavBotBar = controller.position.userScrollDirection == ScrollDirection.forward;
      isHideNavBotBar ? animationController.forward() : animationController.reverse();
    });
    controller2.addListener(() {
      isHideNavBotBar = controller2.position.userScrollDirection == ScrollDirection.forward;
      isHideNavBotBar ? animationController.forward() : animationController.reverse();
    });
    animationController.forward();
    getPages();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeManager>(
            builder: (context, theme, child) => Scaffold(
                bottomNavigationBar: SizeTransition(sizeFactor: animationController, axisAlignment: -1, child: menuBottom(theme)),
                body: body(context, theme))));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    return IndexedStack(
      index: _selectedIndex,
      children: _pages,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget menuBottom(ThemeManager theme) {
    return Container(
      decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1))),
      child: BottomNavigationBar(
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
          backgroundColor: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          selectedItemColor: ColorConfig.accent,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          //New
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), label: 'Akun')
          ]),
    );
  }

  void getPages() {
    _pages = <Widget>[
      HomeScreen(controller: controller),
      ActivityScreen(controller: controller2),
      Icon(Icons.chat, size: 150),
      Icon(Icons.camera, size: 150)
    ];
  }
}
