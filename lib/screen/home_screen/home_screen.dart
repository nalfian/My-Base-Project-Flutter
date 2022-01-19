import 'package:base_project/config/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController controller;

  const HomeScreen({Key key, this.controller}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<ThemeManager>(builder: (context, theme, child) => Scaffold(body: body(context, theme))));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: 300,
      itemBuilder: (context, index) {
        return Text("home");
      },
    );
  }
}
