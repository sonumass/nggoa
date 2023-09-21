import 'package:flutter/material.dart';
import 'package:nggoa/theme/my_theme.dart';
import '../base/page.dart';

class SportsScreen extends AppPageWithAppBar {
  SportsScreen({Key? key}) : super(key: key);

  @override
  double? get toolbarHeight => 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var imageUrlList = [
    "assets/png/yoga1.png",
    "assets/png/yachting2.png",
    "assets/png/wushu_2.png",
    "assets/png/wrestling1.png",
    "assets/png/weightlifting_2.png",
    "assets/png/volly_vall.png",
    "assets/png/triathlon2.png",
    "assets/png/taekwondo2.png",
    "assets/png/table_tennis_2.png",
    "assets/png/squash2.png",
    "assets/png/sqay_martial_art2.png",
    "assets/png/shooting2.png",
    "assets/png/sepak_takraw2.png",
    "assets/png/rugbas2.png",
    "assets/png/roll_ball2.png",
  ];

  @override
  Widget get body {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: MyColors.lineColor,
        drawer: const Drawer(
          child: Text("test"),
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(children: [
              appBarWidget,
              cardWidget,
              SizedBox(
                height: screenHeight / 1.5,
                child: sportsGrid,
              ),
            ])));
  }

  Widget get appBarWidget {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/top_bar.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 17, top: 15, right: 17),
                      child: Image.asset('assets/png/hamburger.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 0, right: 5, top: 20),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/png/ic_user.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get cardWidget {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: screenWidget / 4.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/box_1.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "22",
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w900,
                      color: MyColors.kColorWhite,
                      fontSize: size_15,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Creative Sports",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w500,
                      color: MyColors.kColorWhite,
                      fontSize: size_10,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: screenWidget / 4.5,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage("assets/png/box_2.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "22",
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w900,
                      color: MyColors.kColorWhite,
                      fontSize: size_15,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Ball Sports",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w500,
                      color: MyColors.kColorWhite,
                      fontSize: size_10,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: screenWidget / 4.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/box_3.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "22",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w900,
                      color: MyColors.kColorWhite,
                      fontSize: size_15,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Adversary Sports",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w500,
                      color: MyColors.kColorWhite,
                      fontSize: size_10,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: screenWidget / 4.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/png/box_4.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "22",
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w900,
                      color: MyColors.kColorWhite,
                      fontSize: size_15,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Water Sports",
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: "assets/font/Roboto-Bold.ttf",
                      fontWeight: FontWeight.w500,
                      color: MyColors.kColorWhite,
                      fontSize: size_10,
                      letterSpacing: 0.27,
                      height: 0.9,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get sportsGrid {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20),child: GridView.extent(
      shrinkWrap: true,
      maxCrossAxisExtent: 300,
      children: <Widget>[
        Image.asset(
          imageUrlList[0],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[1],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[2],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[3],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[4],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[5],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[6],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[7],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[8],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[9],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[10],
          fit: BoxFit.fill,
        ),
        Image.asset(
          imageUrlList[11],
          fit: BoxFit.fill,
        ),
      ],
    ),);
  }
}
