import 'package:auto_size_text/auto_size_text.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarCustom(
    {String title,
    Null Function() actionBack,
    BuildContext context,
    PreferredSizeWidget bottom,
    Widget titleImage,
    double fontSize = 16,
    ThemeManager theme,
    bool isShowBack = false,
    Widget actionWidget = const SizedBox()}) {
  return AppBar(
    elevation: 0,
    toolbarHeight: kToolbarHeight,
    centerTitle: false,
    automaticallyImplyLeading: false,
    title: Theme(
      data: Theme.of(context).copyWith(accentColor: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isShowBack,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: InkWell(
                  onTap: () {
                    actionBack.call();
                  },
                  child: Text(
                    String.fromCharCode(Icons.arrow_back_ios_rounded.codePoint),
                    style: TextStyle(
                      inherit: false,
                      color: theme.getThemeState() == ThemeState.dark ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Icons.arrow_back_ios_rounded.fontFamily,
                      package: Icons.arrow_back_ios_rounded.fontPackage,
                    ),
                  )),
            ),
          ),
          Expanded(
            child: titleImage != null
                ? Align(alignment: Alignment.centerLeft, child: titleImage)
                : AutoSizeText(
                    '$title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: theme.getThemeState() == ThemeState.dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          actionWidget
        ],
      ),
    ),
    bottom: bottom,
  );
}
