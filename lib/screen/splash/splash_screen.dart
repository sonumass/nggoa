import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/preferences/AppPreferences.dart';
import '../../services/navigator.dart';
import '../tutorial/tutotial_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  static Future<bool?> start<bool>(String currentPageTitle) {
    return navigateOffAll<bool>(routeName, currentPageTitle: currentPageTitle);
  }

  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final appPreferences = Get.find<AppPreferences>();
  //final controller = Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 0), () {

// Here you can write your code

      setState(() {
        if(appPreferences.isLoggedIn){
         // DashboardPage.start();
          TutorialPage.start("");
        }else{
          TutorialPage.start("");
         // LoginPage.start();
        }

        // Here you can write your code for open new view
      });

    });

    /*controller.callForceUpdateApi().then((value) {
      if (value) {
        if (appPreferences.isLoggedIn) {
          controller.callUserDashboardCardCall("Cart");
          //Home.start();
          return;
        }
       // LoginPage.start();
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/png/background_imagee.png',
            alignment: Alignment.center,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

        ],
      ),
    );
  }
  Widget get logo{
    return Center(child: Image.asset(
      'assets/png/ic_logo.png',
      alignment: Alignment.center,
      width: 100,
      height: 100,
    ));
  }

}
