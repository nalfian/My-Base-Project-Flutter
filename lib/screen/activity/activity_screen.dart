import 'package:base_project/component/app_bar/app_bar_custom.dart';
import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:base_project/screen/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivityScreen extends StatefulWidget {
  final ScrollController controller;

  const ActivityScreen({Key key, this.controller}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<ThemeManager>(
            builder: (context, theme, child) => Scaffold(
                appBar: appBarCustom(
                    title: 'Aktivitasku',
                    fontSize: 28,
                    context: context,
                    theme: theme,
                    actionWidget: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, HistoryScreen.routeName);
                      },
                      child: Text(
                        "Riwayat",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: theme.getThemeState() == ThemeState.dark
                                ? ColorConfig.lightPrimary
                                : ColorConfig.accentLightPrimary),
                      ),
                    )),
                body: body(context, theme))));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    return ListView.builder(
      controller: widget.controller,
      itemCount: 20,
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
                  color: ColorConfig.accentBgLightPrimary,
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
