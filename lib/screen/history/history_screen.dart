import 'package:base_project/component/app_bar/app_bar_custom.dart';
import 'package:base_project/component/safe_area/safe_area_custom.dart';
import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = '/history-screen';
  final ScrollController controller;

  const HistoryScreen({Key key, this.controller}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => SafeAreaCustom(
              theme: theme,
              child: Scaffold(
                  appBar: appBarCustom(
                      title: 'Riwayatku',
                      isShowBack: true,
                      actionBack: () {
                        Navigator.pop(context);
                      },
                      context: context,
                      theme: theme),
                  body: body(context, theme)),
            ));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.sp,
                width: 40.sp,
                margin: EdgeInsets.only(right: 16.sp),
                decoration: BoxDecoration(
                  color: ColorConfig.accent,
                  shape: BoxShape.circle,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Kiwae Ayam kekinian Nologaten",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(width: 16.sp),
                        Text(
                          "Rp32.720",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Text(
                      "17 Jan 2022, 19:33",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
