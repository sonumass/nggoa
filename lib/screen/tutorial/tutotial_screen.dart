import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nggoa/screen/home/home_screen.dart';
import 'package:nggoa/theme/my_theme.dart';
import '../../services/navigator.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);
  static String routeName = "/TutorialPage";
  static Future<bool?> start<bool>(String currentPageTitle) {
    return navigateOffAll<bool>(routeName, currentPageTitle: currentPageTitle);
  }
  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  final List<Widget> _pages=[
    Padding(padding: const EdgeInsets.only(left: 30,right: 20),child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.center,children: [const SizedBox(height: 30,),SizedBox(width:Get.width/2,child: Image.asset("assets/png/ic_logo.png"),),SizedBox(width:Get.width/2.2,height:Get.height/2.2,child: Image.asset("assets/png/moga.png"),),
      Text(
      "Schedule & Result",
      style: MyTextStyle.tutorialTitle,
    ),
     const SizedBox(height: 5,),Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Text(
          "em ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
          style: MyTextStyle.text400,
          maxLines: 3,
          textAlign:TextAlign.center

      ),)],),),
    Padding(padding: const EdgeInsets.only(left: 30,right: 20),child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.center,children: [const SizedBox(height: 30,),SizedBox(width:Get.width/2,child: Image.asset("assets/png/ic_logo.png"),),SizedBox(width:Get.width/2.2,height:Get.height/2.2,child: Image.asset("assets/png/moga.png"),),
      Text(
        "Medal Standing",
        style: MyTextStyle.tutorialTitle,
      ),
      const SizedBox(height: 5,),Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Text(
          "em ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
          style: MyTextStyle.text400,
          maxLines: 3,
          textAlign:TextAlign.center

      ),)],),),
    Padding(padding: const EdgeInsets.only(left: 30,right: 20),child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.center,children: [const SizedBox(height: 30,),SizedBox(width:Get.width/2,child: Image.asset("assets/png/ic_logo.png"),),SizedBox(width:Get.width/2.2,height:Get.height/2.2,child: Image.asset("assets/png/moga.png"),),
      Text(
        "Latest News",
        style: MyTextStyle.tutorialTitle,
      ),
      const SizedBox(height: 5,),Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Text(
          "em ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
          style: MyTextStyle.text400,
          maxLines: 3,
          textAlign:TextAlign.center

      ),)],),),
    Padding(padding: const EdgeInsets.only(left: 30,right: 20),child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.center,children: [const SizedBox(height: 30,),SizedBox(width:Get.width/2,child: Image.asset("assets/png/ic_logo.png"),),SizedBox(width:Get.width/2.2,height:Get.height/2.2,child: Image.asset("assets/png/moga.png"),),
      Text(
        "Multiple Dashboard",
        style: MyTextStyle.tutorialTitle,
      ),
      const SizedBox(height: 5,),Padding(padding: const EdgeInsets.only(left: 20,right: 20),child: Text(
          "em ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
          style: MyTextStyle.text400,
          maxLines: 3,
          textAlign:TextAlign.center

      ),)],),)

    ];
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  Widget get  pageText{
    return Stack(children: [
      SizedBox( width: Get.width,height: Get.height,child: Image.asset("assets/png/moga.png"),)

    ],);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/png/ic_background.png',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            allowImplicitScrolling: true,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.transparent,
              child: Column(children: [Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    _pages.length,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          _pageController.animateToPage(index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: _activePage == index
                              ? Colors.white
                              : Colors.grey,
                        ),
                      ),
                    )),
              ),const SizedBox(height: 20,),InkWell(onTap:(){HomePage.start("");},child: Image.asset("assets/png/buttom_stated.png"),)],),
            ),
          ),
        ],
      ),
    );
  }




}