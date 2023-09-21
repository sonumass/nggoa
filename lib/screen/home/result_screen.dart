import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nggoa/screen/commmonwidget/card_header.dart';
import 'package:nggoa/theme/my_theme.dart';
import '../base/page.dart';
import '../commmonwidget/app_heading.dart';
import '../commmonwidget/liquid_button.dart';

class ResultScreen extends AppPageWithAppBar {
  ResultScreen({Key? key}) : super(key: key);

  @override
  double? get toolbarHeight => 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              stateName,
              const SizedBox(
                height: 10,
              ),
              medalStanding("Medal Standing"),
              const SizedBox(
                height: 10,
              ),
              medalCard,
              const SizedBox(
                height: 10,
              ),
              medalStanding("Athletes"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 300,
                child: _scheduleList(5),
              ),
              const SizedBox(
                height: 20,
              ),
              medalStanding("Medalist"),
              SizedBox(
                height: 300,
                child: medalistCard,
              ),
              latest,
              SizedBox(
                height: 320,
                child: _latestNewsList(5),
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

  Widget get stateName {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(width: 20, height: 20, "assets/png/left_arrow.png"),
          SizedBox(
            width: size_2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              "Jammu & kashmir",
              style: TextStyle(
                fontFamily: "assets/font/Roboto-Bold.ttf",
                fontWeight: FontWeight.w400,
                color: MyColors.textHeadingPurpal,
                fontSize: size_12,
                letterSpacing: 0.27,
                height: 0.9,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget medalStanding(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppHeadingLabel(label: label),
        ],
      ),
    );
  }

  Widget get medalCard {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeadingCard(
              width: screenWidget,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidget / 3.5,
                      child: Text(
                        "Team",
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w700,
                          color: MyColors.kColorWhite,
                          fontSize: size_15,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidget / 2.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: SvgPicture.asset("assets/png/gold.svg",
                                semanticsLabel: 'Acme Logo'),
                          ),
                          SizedBox(
                            child: SvgPicture.asset("assets/png/silver.svg",
                                semanticsLabel: 'Acme Lo'),
                          ),
                          SizedBox(
                            child: SvgPicture.asset("assets/png/browen.svg",
                                semanticsLabel: 'Acme Lo'),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            "Total",
                            style: TextStyle(
                              fontFamily: "assets/font/Roboto-Bold.ttf",
                              fontWeight: FontWeight.w700,
                              color: MyColors.kColorWhite,
                              fontSize: size_15,
                              letterSpacing: 0.27,
                              height: 0.9,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Container(
            width: screenWidget,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.kColorGrey, width: .50),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenWidget / 2.5,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/png/jandk.svg",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Jammu & Kashmir",
                              style: TextStyle(
                                fontFamily: "assets/font/Roboto-Bold.ttf",
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                                fontSize: size_12,
                                letterSpacing: 0.27,
                                height: 0.9,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidget / 2.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontFamily: "assets/font/Roboto-Bold.ttf",
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.kColorBlack,
                                    fontSize: size_10,
                                    letterSpacing: 0.27,
                                    height: 0.9,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontFamily: "assets/font/Roboto-Bold.ttf",
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.kColorBlack,
                                    fontSize: size_10,
                                    letterSpacing: 0.27,
                                    height: 0.9,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 26,
                              height: 26,
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontFamily: "assets/font/Roboto-Bold.ttf",
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.kColorBlack,
                                    fontSize: size_10,
                                    letterSpacing: 0.27,
                                    height: 0.9,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontFamily: "assets/font/Roboto-Bold.ttf",
                                fontWeight: FontWeight.w700,
                                color: MyColors.kColorBlack,
                                fontSize: size_10,
                                letterSpacing: 0.27,
                                height: 0.9,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ListView _scheduleList(int n) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem(
              "assets/png/avtaar.png",
              "22 Oct 2023 -27 Oct 2023",
              "Netball-Panjim",
              "Campal Multi-Purpose Indoor Stadium"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "29 Oct 2023-2 Nov 2023",
              "Kabaddi-Panjim", "Campal Multi-Purpose Indoor Stadium"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "4 Nov 2023-8 Nov 2023",
              "Table Tennis-Panjim", "Campal Multi-Purpose Indoor Stadium "),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem(
              "assets/png/avtaar.png",
              "25 Oct 2023-29 Oct 2023",
              "Weightlifting-Panjim",
              "Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "1 Nov 2023-4 Nov 2023",
              "Wushu-Panjim", "Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "6 Nov 2023-8 Nov 2023",
              "Judo-Panjim", "Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem(
              "assets/png/avtaar.png",
              "26 Oct 2023-29 Oct 2023",
              "Pencak Silat-Panjim",
              "Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "31 Oct 2023-2 Nov 2023",
              "Gatka-Panjim", "Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/avtaar.png", "5 Nov 2023-8 Nov 2023",
              "Yoagasana-Panjim", "Campal Open Ground (Campal Sports Village)"),
        ),
      ],
    );
  }

  Widget scheduleItem(String images, String date, String venue, String des) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Image.asset(
                        images,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 10,
                  thickness: 5,
                  color: MyColors.blue,
                ),
                SizedBox(
                  width: screenWidget / 1.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w400,
                          color: MyColors.textPurpal,
                          fontSize: size_15,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        venue,
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w500,
                          color: MyColors.kColorBlack,
                          fontSize: size_15,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        des,
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w400,
                          color: MyColors.colorTextGrey,
                          fontSize: size_15,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {},
                child: Image.asset("assets/png/arrow.png"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get latest {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppHeadingLabel(label: "Latest News"),
          RaisedGradientButton(
            width: 150,
            height: 35,
            onPressed: () {},
            buttonText: 'Show More ',
          ),
        ],
      ),
    );
  }

  ListView _latestNewsList(int n) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: newsItem(
              "assets/png/new_image_1.jpg",
              "Sep 06, 2023",
              "Unveiling India's Grandeur: IOA Presents Ceremonial Dress and Player Kit for Hangzhou Asian Games",
              "In a momentous event that resonated with national pride, the Indian Olympic Association (IOA) unveiled the official ceremonial dress and player kit for the Indian contingent set to shine at the much-anticipated 2022 Asian Games in Hangzhou, China. Scheduled from September 23 to October 8, this global sporting extravaganza promises to be a spectacle of unity and athletic excellence."),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: newsItem(
              "assets/png/news_images_2.jpeg",
              "June 19, 2023",
              "moga: The Enthusiastic Mascot of the 37th National Games Takes Center Stage Panaji",
              "In a momentous ceremony that coincided with the celebration of Goa Kranti Din, Chief Minister Dr. Pramod Sawant unveiled MOGA, the spirited Mascot representing the 37th National Games. This auspicious event unfolded at the Dr. Shyama Prasad Mukherjee Stadium-Taleigao and was orchestrated by the Directorate of Sports and Youth Affairs in conjunction with the Sports Authority of Goa."),
        ),
        Container(
          width: screenWidget / 2,
          alignment: Alignment.center,
          child: newsItem(
              "assets/png/news_images_3.jpg",
              "May 15, 2023",
              "CM Pramod Sawant Unveils Dazzling Logo for 37th National Games",
              "Panaji, May 15, 2023 - The stage was set for an epic showcase of athleticism and national pride as Chief Minister Pramod Sawant took center stage to reveal the emblem of the eagerly awaited 37th National Games. In a remarkable moment of sportsmanship, Sawant, on a vibrant Sunday, unveiled the logo with a flourish - a symbolic bow and arrow, at the iconic Dr. Shyama Prasad Mukherjee stadium on the picturesque Taleigao Plateau. The message was clear: Goa stands poised to host an exhilarating sporting spectacle."),
        )
      ],
    );
  }

  Widget newsItem(String image, String date, String title, String des) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: screenWidget / 2,
                child: Image.asset(
                  image,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                date,
                style: TextStyle(
                  fontFamily: "assets/font/Roboto-Bold.ttf",
                  fontWeight: FontWeight.w400,
                  color: MyColors.colorTextGrey,
                  fontSize: size_15,
                  letterSpacing: 0.27,
                  height: 0.9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                title,
                maxLines: 3,
                style: TextStyle(
                  fontFamily: "assets/font/Roboto-Bold.ttf",
                  fontWeight: FontWeight.w700,
                  color: MyColors.kColorBlack,
                  fontSize: size_15,
                  letterSpacing: 0.27,
                  height: 0.9,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                des,
                maxLines: 4,
                style: TextStyle(
                  fontFamily: "assets/font/Roboto-Bold.ttf",
                  fontWeight: FontWeight.w300,
                  color: MyColors.colorTextGrey,
                  fontSize: size_15,
                  letterSpacing: 0.27,
                  height: 0.9,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  "Read More>>",
                  style: TextStyle(
                    fontFamily: "assets/font/Roboto-Bold.ttf",
                    fontWeight: FontWeight.w400,
                    color: MyColors.textPurpal,
                    fontSize: size_15,
                    letterSpacing: 0.27,
                    height: 0.9,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get medalistCard {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeadingCard(
              width: screenWidget,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidget / 2.7,
                      child: Text(
                        "Team & Athlete Name ",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w400,
                          color: MyColors.kColorWhite,
                          fontSize: size_15,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidget / 2.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidget / 4.5,
                                child: Text(
                                  maxLines: 1,
                                  "Sport & Event",
                                  style: TextStyle(
                                    fontFamily: "assets/font/Roboto-Bold.ttf",
                                    fontWeight: FontWeight.w400,
                                    color: MyColors.kColorWhite,
                                    fontSize: size_15,
                                    letterSpacing: 0.27,
                                    height: 0.9,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidget / 5.6,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Medal",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: "assets/font/Roboto-Bold.ttf",
                                      fontWeight: FontWeight.w400,
                                      color: MyColors.kColorWhite,
                                      fontSize: size_15,
                                      letterSpacing: 0.27,
                                      height: 0.9,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            width: screenWidget,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.kColorGrey, width: .50),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [ 
                  const SizedBox(height: 10,),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidget / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/png/jammu_kashmir.png"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jammu & Kashmir",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_12,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Player Number 00002",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w300,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_10,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5,left: 10),
                                  child: Image.asset("assets/png/blue_line.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidget / 2.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidget / 3.4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5),
                                        child: Text(
                                          "Aquatics - Swimming and Para Swimming Women’s Synchronised 10m Platform",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily:
                                                "assets/font/Roboto-Bold.ttf",
                                            fontWeight: FontWeight.w300,
                                            color: MyColors.kColorBlack,
                                            fontSize: size_10,
                                            letterSpacing: 0.27,
                                            height: 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 5),
                                      child: Image.asset(
                                          "assets/png/blue_line.png"),
                                    ),
                                    SizedBox(
                                      width: screenWidget / 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                              "assets/png/glod_icon.svg"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidget / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/png/jammu_kashmir.png"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jammu & Kashmir",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_12,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Player Number 00002",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w300,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_10,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 5, bottom: 5,left: 10),
                                  child: Image.asset("assets/png/blue_line.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidget / 2.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidget / 3.4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5),
                                        child: Text(
                                          "Aquatics - Swimming and Para Swimming Women’s Synchronised 10m Platform",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily:
                                            "assets/font/Roboto-Bold.ttf",
                                            fontWeight: FontWeight.w300,
                                            color: MyColors.kColorBlack,
                                            fontSize: size_10,
                                            letterSpacing: 0.27,
                                            height: 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 5),
                                      child: Image.asset(
                                          "assets/png/blue_line.png"),
                                    ),
                                    SizedBox(
                                      width: screenWidget / 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                              "assets/png/glod_icon.svg"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidget / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/png/jammu_kashmir.png"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jammu & Kashmir",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_12,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Player Number 00002",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w300,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_10,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 5, bottom: 5,left: 10),
                                  child: Image.asset("assets/png/blue_line.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidget / 2.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidget / 3.4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5),
                                        child: Text(
                                          "Aquatics - Swimming and Para Swimming Women’s Synchronised 10m Platform",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily:
                                            "assets/font/Roboto-Bold.ttf",
                                            fontWeight: FontWeight.w300,
                                            color: MyColors.kColorBlack,
                                            fontSize: size_10,
                                            letterSpacing: 0.27,
                                            height: 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 5),
                                      child: Image.asset(
                                          "assets/png/blue_line.png"),
                                    ),
                                    SizedBox(
                                      width: screenWidget / 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                              "assets/png/glod_icon.svg"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: screenWidget / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/png/jammu_kashmir.png"),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jammu & Kashmir",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w400,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_12,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "Player Number 00002",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily:
                                        "assets/font/Roboto-Bold.ttf",
                                        fontWeight: FontWeight.w300,
                                        color: MyColors.kColorBlack,
                                        fontSize: size_10,
                                        letterSpacing: 0.27,
                                        height: 0.9,
                                      ),
                                    )
                                  ],
                                )),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(top: 5, bottom: 5,left: 10),
                                  child: Image.asset("assets/png/blue_line.png"),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidget / 2.1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: screenWidget / 3.4,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 5),
                                        child: Text(
                                          "Aquatics - Swimming and Para Swimming Women’s Synchronised 10m Platform",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontFamily:
                                            "assets/font/Roboto-Bold.ttf",
                                            fontWeight: FontWeight.w300,
                                            color: MyColors.kColorBlack,
                                            fontSize: size_10,
                                            letterSpacing: 0.27,
                                            height: 0.9,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5, left: 5),
                                      child: Image.asset(
                                          "assets/png/blue_line.png"),
                                    ),
                                    SizedBox(
                                      width: screenWidget / 10,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: SvgPicture.asset(
                                              "assets/png/glod_icon.svg"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
