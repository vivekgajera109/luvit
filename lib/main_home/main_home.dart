import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luvit/constant/app_colors.dart';
import 'package:luvit/constant/app_style.dart';
import 'package:luvit/constant/static_decoration.dart';
import 'package:luvit/home_view/home_view.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;

  List viewList = [
    const HomeView(),
    Center(
      child: Text(
        "스팟",
        style: AppTextStyle.normalRegularBold20,
      ),
    ),
    Container(),
    Center(
      child: Text(
        "채팅",
        style: AppTextStyle.normalRegularBold20,
      ),
    ),
    Center(
      child: Text(
        "마이",
        style: AppTextStyle.normalRegularBold20,
      ),
    ),
  ];
  @override

  /// Builds the widget tree for the [MainHome] widget.
  ///
  /// This method builds the widget tree for the [MainHome] widget.
  /// It returns a [Scaffold] widget that contains the bottom navigation bar,
  /// app bar, and body of the widget.
  ///
  /// The bottom navigation bar is a [ConvexAppBar] widget that contains a list
  /// of [TabItem] widgets. Each [TabItem] widget represents a tab in the
  /// bottom navigation bar. The [TabItem] widgets are customized with icons and
  /// titles. The selected tab is indicated by the [selectedIndex] variable.
  /// The [onTap] callback is triggered when a tab is tapped, and it updates
  /// the [selectedIndex] variable and calls the [setState] method to rebuild
  /// the widget.
  ///
  /// The app bar is an [AppBar] widget with a leading icon, a title, and a group
  /// of actions. The leading icon is an [SvgPicture] widget that displays the
  /// 'Ikon.svg' asset. The title is a [Text] widget that displays the '목이길어슬픈기린님의 새로운 스팟'
  /// text. The actions are a group of widgets that display icons and a [Text]
  /// widget. The icons are [SvgPicture] widgets that display different assets.
  ///
  /// The body of the widget is determined by the [selectedIndex] variable. The
  /// [viewList] variable contains a list of widgets that represent the different
  /// views. The [elementAt] method of the [viewList] variable is used to get the
  /// widget that corresponds to the selected index.
  Widget build(BuildContext context) {
    return Scaffold(
      // Bottom navigation bar
      bottomNavigationBar: ConvexAppBar(
        elevation: 10,
        style: TabStyle.fixedCircle,
        backgroundColor: appPrimaryColor,
        shadowColor: borderColor,
        height: 60,
        cornerRadius: 12,
        activeColor: pinkColor,
        items: [
          // Tab item for home tab
          TabItem(
            icon: SvgPicture.asset(
              "assets/icons/ic_GNB.svg",
              color: _selectedIndex == 0 ? pinkColor : borderColor,
            ),
            title: '홈',
          ),
          // Tab item for spot tab
          TabItem(
            icon: SvgPicture.asset(
              "assets/icons/location.svg",
              color: _selectedIndex == 1 ? pinkColor : borderColor,
            ),
            title: '스팟',
          ),
          // Tab item for add tab
          TabItem(
            icon: SvgPicture.asset(
              "assets/icons/Group 61.svg",
              fit: BoxFit.cover,
            ),
            title: 'Add',
          ),
          // Tab item for chat tab
          TabItem(
            icon: SvgPicture.asset(
              "assets/icons/chat.svg",
              color: _selectedIndex == 3 ? pinkColor : borderColor,
            ),
            title: '채팅',
          ),
          // Tab item for my tab
          TabItem(
            icon: SvgPicture.asset(
              "assets/icons/profile.svg",
              color: _selectedIndex == 4 ? pinkColor : borderColor,
            ),
            title: '마이',
          ),
        ],
        onTap: (int i) {
          _selectedIndex = i;
          setState(() {});
        },
      ),
      // App bar
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
              bottom: 5.0, left: 10.0, right: 0.0, top: 5.0),
          child: SvgPicture.asset(
            'assets/icons/Ikon.svg',
          ),
        ),
        leadingWidth: 28,
        title: Text(
          '목이길어슬픈기린님의 새로운 스팟',
          style: AppTextStyle.normalSemiBold15,
        ),
        actions: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/star.svg"),
                width05,
                Text(
                  "123,456",
                  style: AppTextStyle.normalRegularBold15,
                )
              ],
            ),
          ),
          width10,
          SvgPicture.asset("assets/icons/notifications.svg"),
          width05
        ],
      ),
      // Body of the widget
      body: viewList.elementAt(_selectedIndex),
    );
  }
}
