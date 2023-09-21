import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nggoa/model/banner.dart';
import 'package:nggoa/screen/home/widget/photo_gallery.dart';
import 'package:nggoa/theme/my_theme.dart';
import '../base/page.dart';
import '../commmonwidget/gallaery.dart';
import '../commmonwidget/liquid_button.dart';

class DashboardScreen extends AppPageWithAppBar {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  double? get toolbarHeight => 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<BannerData> bannerList = [
    BannerData(bannerId: 1, img: ""),
    BannerData(bannerId: 1, img: ""),
    BannerData(bannerId: 1, img: "")
  ];
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
  int currentIndex = 0;

  @override
  Widget get body {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyColors.lineColor,
      drawer: const Drawer(
        child: Text("test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarWidget,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: bannerBar,
            ),
            status,
            latest,
            SizedBox(
              height: 320,
              child: _latestNewsList(5),
            ),
            schedule,
            SizedBox(
              height: 300,
              child: _scheduleList(5),
            ),
            mascot,
            Image.asset("assets/png/moscot.png"),
            photoGallery,
            SizedBox(
              height: 200,
              child: photoGalleryView,
            ),
            sports,
            buildGallery3D(),
            competitionZone,
            Image.asset("assets/png/compitition_jone.png"),
            socialMedia,
            SizedBox(
              height: 300,
              child: _socialMediaList(5),
            ),
            const SizedBox(
              height: 20,
            ),
            paweredBy,
          ],
        ),
      ),
    );
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
                      padding: const EdgeInsets.only(left: 17,top: 15,right: 17),
                      child: Image.asset('assets/png/hamburger.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 5, top: 20),
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
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 5, top: 20),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/png/noti.png'),
                              ),
                            ],
                          ),
                        ),
                      )
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

  Widget get bannerBar {
    return Stack(
      children: [
        Image.asset("assets/png/ic_banner.png"),
        Positioned(
            left: 20,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome To",
                  style: TextStyle(
                    fontFamily: "assets/font/Roboto-Bold.ttf",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: size_14,
                    letterSpacing: 0.27,
                    height: 0.9,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "37 National Games,Goa",
                  style: TextStyle(
                    fontFamily: "assets/font/Roboto-Bold.ttf",
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: size_14,
                    letterSpacing: 0.27,
                    height: 0.9,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset("assets/png/divider_vertical.png"),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      child: Text(
                        "Welcome to the 37th National Games Goa, where passion meets excellence! Experience the heart-pounding action as athletes from across India compete in a spectacular showcase of talent and sportsmanship. Join us in celebrating our rich sporting heritage and igniting the spirit of unity. Get ready to be part of this unforgettable journey towards sporting greatness. Get Set Goa and witness the magic of the National Games",
                        maxLines: 6,
                        style: TextStyle(
                          fontFamily: "assets/font/Roboto-Bold.ttf",
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: size_12,
                          letterSpacing: 0.27,
                          height: 0.9,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ))
      ],
    );
  }

  Widget get status {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SizedBox(width: screenWidget/3,child: statasItem("23", "STATES"),),
                SizedBox(width: screenWidget/2,child: statasItem("8", "UNION TERRITORIES")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(color: MyColors.textPurpal,height: 5,),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screenWidget/3,child: statasItem("8000+", "PLAYERS")),
                SizedBox(width: screenWidget/2,child: statasItem("43+", "GAMES+"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget statasItem(String count, String name) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontFamily: "assets/font/Roboto-Bold.ttf",
            fontWeight: FontWeight.w900,
            color: MyColors.textPurpal,
            fontSize: size_20,
            letterSpacing: 0.27,
            height: 0.9,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.asset("assets/png/divider_hori.png")),
        Text(
          name,
          style: TextStyle(
            fontFamily: "assets/font/Roboto-Bold.ttf",
            fontWeight: FontWeight.w700,
            color: MyColors.kColorBlack,
            fontSize: size_15,
            letterSpacing: 0.27,
            height: 0.9,
          ),
        ),
      ],
    );
  }

  Widget get latest {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Latest News",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
          RaisedGradientButton(
            width: 150,height: 35,
            onPressed: (){

            }, buttonText: 'Show More ',
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
        width: Get.width / 2,
        alignment: Alignment.center,
        child: newsItem("assets/png/new_image_1.jpg","Sep 06, 2023","Unveiling India's Grandeur: IOA Presents Ceremonial Dress and Player Kit for Hangzhou Asian Games","In a momentous event that resonated with national pride, the Indian Olympic Association (IOA) unveiled the official ceremonial dress and player kit for the Indian contingent set to shine at the much-anticipated 2022 Asian Games in Hangzhou, China. Scheduled from September 23 to October 8, this global sporting extravaganza promises to be a spectacle of unity and athletic excellence."),
      ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: newsItem("assets/png/news_images_2.jpeg","June 19, 2023","moga: The Enthusiastic Mascot of the 37th National Games Takes Center Stage Panaji","In a momentous ceremony that coincided with the celebration of Goa Kranti Din, Chief Minister Dr. Pramod Sawant unveiled MOGA, the spirited Mascot representing the 37th National Games. This auspicious event unfolded at the Dr. Shyama Prasad Mukherjee Stadium-Taleigao and was orchestrated by the Directorate of Sports and Youth Affairs in conjunction with the Sports Authority of Goa."),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: newsItem("assets/png/news_images_3.jpg","May 15, 2023","CM Pramod Sawant Unveils Dazzling Logo for 37th National Games","Panaji, May 15, 2023 - The stage was set for an epic showcase of athleticism and national pride as Chief Minister Pramod Sawant took center stage to reveal the emblem of the eagerly awaited 37th National Games. In a remarkable moment of sportsmanship, Sawant, on a vibrant Sunday, unveiled the logo with a flourish - a symbolic bow and arrow, at the iconic Dr. Shyama Prasad Mukherjee stadium on the picturesque Taleigao Plateau. The message was clear: Goa stands poised to host an exhilarating sporting spectacle."),
        )
      ],
    );
  }

  Widget newsItem(String image ,String date,String title,String des) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: Get.width / 2,
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
              child: Text(title,
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
                  fontWeight: FontWeight.w400,
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
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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

  Widget get schedule {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Schedule",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
          RaisedGradientButton(
            width: 150,height: 35,
            onPressed: (){

            }, buttonText: 'Show More ',
          ),
        ],
      ),
    );
  }

  ListView _scheduleList(int n) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children:[Container(
        width: Get.width / 2,
        alignment: Alignment.center,
        child: scheduleItem("assets/png/netball.png","22 Oct 2023 -27 Oct 2023","Netball-Panjim","Campal Multi-Purpose Indoor Stadium"),
      ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/kabaddi.png","29 Oct 2023-2 Nov 2023","Kabaddi-Panjim","Campal Multi-Purpose Indoor Stadium"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/tennis.png","4 Nov 2023-8 Nov 2023","Table Tennis-Panjim","Campal Multi-Purpose Indoor Stadium "),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/weightlifting.png","25 Oct 2023-29 Oct 2023","Weightlifting-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/wushu.png","1 Nov 2023-4 Nov 2023","Wushu-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/judo.png","6 Nov 2023-8 Nov 2023","Judo-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/weightlifting.png","26 Oct 2023-29 Oct 2023","Pencak Silat-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/gatka.png","31 Oct 2023-2 Nov 2023","Gatka-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
        Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: scheduleItem("assets/png/yoga.png","5 Nov 2023-8 Nov 2023","Yoagasana-Panjim","Campal Open Ground (Campal Sports Village)"),
        ),
      ],
    );
  }

  Widget scheduleItemm() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/png/ic_schedule.png",
        ),
        Text("data")
      ],
    );
  }

  Widget scheduleItem(String images,String date,String venue,String des) {
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
                  child: Container(height:70,width: 70,decoration: const BoxDecoration(color: Colors.purple,borderRadius: BorderRadius.all(Radius.circular(10))),child: Center(child: Image.asset(
                    images,
                    height: 50,width: 50,
                  ),),),
                ),
                const Divider(
                  height: 10,
                  thickness: 5,
                  color: MyColors.blue,
                ),
                SizedBox(
                  width: Get.width / 1.7,
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

  Widget get mascot {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Mascot",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget get photoGallery {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Photo Gallery",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget get photoGalleryView {
    return NestedTabBar(title);
  }

  Widget get sports {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Sports",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGallery3D() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Gallery3D(
          controller: Gallery3DController(itemCount: imageUrlList.length),
          width: Get.width,
          height: 300,
          isClip: true,

          // ellipseHeight: 80,
          // currentIndex: currentIndex,
          onItemChanged: (index) {
            //setState(() {
            currentIndex = index;
            // });
          },
          itemConfig: const GalleryItemConfig(
            width: 220,
            height: 300,
            radius: 10,
            isShowTransformMask: false,
            // shadows: [
            //   BoxShadow(
            //       color: Color(0x90000000), offset: Offset(2, 0), blurRadius: 5)
            // ]
          ),
          onClickItem: (index) {
            //if (kDebugMode) print("currentIndex:$index");
          },
          itemBuilder: (context, index) {
            return Image.asset(
              imageUrlList[index],
              fit: BoxFit.fill,
            );
          }),
    );
  }

  Widget get competitionZone {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Competition Zone",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget get socialMedia {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Social Media",
            style: TextStyle(
              fontFamily: "assets/font/Roboto-Bold.ttf",
              fontWeight: FontWeight.w900,
              color: MyColors.kColorBlack,
              fontSize: size_25,
              letterSpacing: 0.27,
              height: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  ListView _socialMediaList(int n) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: List.generate(
        n,
        (i) => Container(
          width: Get.width / 2,
          alignment: Alignment.center,
          child: socialItem(),
        ),
      ),
    );
  }

  Widget socialItem() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: Get.width / 2,
                child: Image.asset(
                  "assets/png/social_media.png",
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget get paweredBy {
    return Container(
      height: 200,
      width: Get.width,
      color: MyColors.kColorWhite,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Game Partners",
              style: TextStyle(
                fontFamily: "assets/font/Roboto-Bold.ttf",
                fontWeight: FontWeight.w500,
                color: MyColors.kColorBlack,
                fontSize: size_20,
                letterSpacing: 0.27,
                height: 0.9,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/png/power_by.png")
          ],
        ),
      ),
    );
  }
}
