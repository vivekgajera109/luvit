import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luvit/constant/app_colors.dart';
import 'package:luvit/constant/app_style.dart';
import 'package:luvit/constant/static_decoration.dart';
import 'package:luvit/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return Scaffold(
            body: Stack(
              children: [
                carouselSlider(homeProvider, screenHeight, screenWidth),
                Positioned(
                  top: 30,
                  child: Center(
                    child: Container(
                      width: screenWidth,
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.25 / 2),
                      child: _buildIndicatorRow(homeProvider, screenWidth),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Row _buildIndicatorRow(HomeProvider homeProvider, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        homeProvider.imgList.length,
        (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 3.5,
            decoration: BoxDecoration(
              color: homeProvider.selectedIndex == index
                  ? pinkColor
                  : appPrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

CarouselSlider carouselSlider(HomeProvider value, double height, double width) {
  return CarouselSlider(
    options: CarouselOptions(
      onScrolled: (v) {
        // value.selectedIndex = v;
      },
      onPageChanged: (index, reason) {
        value.selectedIndex = index;
        value.refresh();
      },
      // height: height * 0.3,
      viewportFraction: 0.85,
      aspectRatio: 1.9 / 3,
      autoPlay: true,
      enlargeCenterPage: false,
      // autoPlay: false,
    ),
    items: value.imgList
        .map((item) => Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [Colors.transparent, appPrimaryColor],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ShaderMask(
                      blendMode: BlendMode.darken,
                      shaderCallback: (bounds) {
                        return const LinearGradient(
                            stops: [0.07, 1],
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ]).createShader(bounds);
                      },
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        height: height,
                      ),
                    ),
                  ),
                ),
                footerWidget(width, item),
              ],
            ))
        .toList(),
  );
}

Positioned footerWidget(double width, DataModel data) {
  return Positioned(
    bottom: 30,
    child: SizedBox(
      width: width - 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStars(data),
                      _buildNameAge(data),
                      _buildDecoration(data),
                      _buildTags(data),
                    ],
                  ),
                ),
                width15,
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset("assets/icons/btcon_48.svg"),
                  ),
                )
              ],
            ),
            const Icon(Icons.keyboard_arrow_down_rounded, color: appWhiteColor),
          ],
        ),
      ),
    ),
  );
}

Widget _buildStars(DataModel data) {
  return Chip(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset("assets/icons/star.svg", height: 15, width: 15),
        const SizedBox(width: 5),
        Text(data.likes, style: AppTextStyle.normalRegularBold12),
      ],
    ),
  );
}

Widget _buildNameAge(DataModel data) {
  return Row(
    children: [
      Text(data.name, style: AppTextStyle.normalSemiBold25),
      Text(data.age,
          style: AppTextStyle.normalSemiBold25
              .copyWith(fontWeight: FontWeight.w300)),
    ],
  );
}

Widget _buildDecoration(DataModel data) {
  return Text(data.decoration,
      style: AppTextStyle.normalSemiBold15
          .copyWith(fontWeight: FontWeight.w300, fontSize: 13));
}

Widget _buildTags(DataModel data) {
  return Wrap(
    runSpacing: 0,
    children: data.tag.map((tag) => _buildTagChip(tag)).toList(),
  );
}

Widget _buildTagChip(TagModel tag) {
  return Chip(
    visualDensity: const VisualDensity(vertical: -3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(tag.tagIcons),
        const SizedBox(width: 5),
        Text(tag.name, style: AppTextStyle.normalRegularBold12),
      ],
    ),
  );
}
