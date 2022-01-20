import 'package:auto_size_text/auto_size_text.dart';
import 'package:base_project/component/app_bar/app_bar_custom.dart';
import 'package:base_project/config/color_config.dart';
import 'package:base_project/config/size_config.dart';
import 'package:base_project/config/theme_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController controller;

  const HomeScreen({Key key, this.controller}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    '',
    '',
    '',
    '',
    '',
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
        builder: (context, theme, child) => Scaffold(
            appBar: appBarCustom(
                title: 'Base Project',
                fontSize: 28,
                context: context,
                theme: theme,
                isShowBack: false,
                actionWidget: Icon(CupertinoIcons.bell_solid, color: Colors.white)),
            body: body(context, theme)));
  }

  Widget body(BuildContext context, ThemeManager theme) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Container(color: ColorConfig.accent, width: double.infinity)),
            ))
        .toList();

    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Container(
              color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : ColorConfig.lightPrimary,
              child: Stack(
                children: [
                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 50, top: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hai, ",
                                      style: TextStyle(fontSize: 17, color: Colors.white),
                                    ),
                                    AutoSizeText(
                                      'Nur Alfian Julianda',
                                      style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                                      minFontSize: 10,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                AutoSizeText(
                                  "Daerah Istimewa Yogyakarta",
                                  maxLines: 1,
                                  minFontSize: 10,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0, left: 0, bottom: 0, child: SvgPicture.asset("assets/bg_header_home1.svg", fit: BoxFit.fill)),
                  Positioned(
                      right: 0, left: 0, bottom: 0, child: SvgPicture.asset("assets/bg_header_home2.svg", fit: BoxFit.fill)),
                ],
              ),
            ),
          ),
        ),
        Container(
          color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white,
          padding: EdgeInsets.fromLTRB(16, 16, 16, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Layanan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                children: [menuHome(), menuHome(), menuHome(), menuHome()],
              ),
              SizedBox(height: 16),
              Row(
                children: [menuHome(), menuHome(), menuHome(), menuHome()],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                        child: Text('Info dan Promo Spesial', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    Text('Lihat Semua', style: TextStyle(color: ColorConfig.accent, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                    aspectRatio: 2.5,
                    viewportFraction: 0.9,
                    initialPage: _current,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: imageSliders,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? theme.getThemeState() == ThemeState.dark
                                ? Colors.white70
                                : Colors.black87
                            : theme.getThemeState() == ThemeState.dark
                                ? Colors.grey.withOpacity(0.5)
                                : Colors.grey),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(child: Text('Rekomendasi Pilihan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    Text('Lihat Semua', style: TextStyle(color: ColorConfig.accent, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: imgList.map((country) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: SizeConfig.screenWidth / 2.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 10 / 6,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(8)), child: Container(color: ColorConfig.accent)),
                            ),
                            SizedBox(height: 8),
                            Text('Pinjaman Kartu Kredit', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            SizedBox(height: 4),
                            Text('Bebas Ubah Transaksi Jadi Cicilan 0%',)
                          ],
                        ),
                      );
                    }).toList(),
                  )),
              SizedBox(height: 16),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          color: theme.getThemeState() == ThemeState.dark ? ColorConfig.darkPrimary : Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Terdekat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                  Text('Lihat Semua', style: TextStyle(color: ColorConfig.accent, fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)), child: Container(color: ColorConfig.accent)),
                          ),
                          SizedBox(height: 8),
                          Text('Diskon heboh ke sekolah',),
                          Text('Sampai 27 Januari 2022', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)), child: Container(color: ColorConfig.accent)),
                          ),
                          SizedBox(height: 8),
                          Text('Diskon heboh ke sekolah',),
                          Text('Sampai 27 Januari 2022', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)), child: Container(color: ColorConfig.accent)),
                          ),
                          SizedBox(height: 8),
                          Text('Diskon heboh ke sekolah',),
                          Text('Sampai 27 Januari 2022', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      width: SizeConfig.screenWidth / 2.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(8)), child: Container(color: ColorConfig.accent)),
                          ),
                          SizedBox(height: 8),
                          Text('Diskon heboh ke sekolah',),
                          Text('Sampai 27 Januari 2022', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget menuHome() {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: ColorConfig.accent,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 8),
          Text('Menu')
        ],
      ),
    );
  }
}
