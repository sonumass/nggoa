import 'package:flutter/material.dart';
import 'package:nggoa/screen/home/result_screen.dart';
import 'package:nggoa/screen/home/sports_screen.dart';
import '../../services/navigator.dart';
import '../../theme/my_theme.dart';
import 'dashboard_screen.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/MyHomePage";

  static Future<bool?> start<bool>(String currentPageTitle) {
    return navigateOffAll<bool>(routeName, currentPageTitle: currentPageTitle);
  }

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Widget currentScreen =DashboardScreen();
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    DashboardScreen(),
    SportsScreen(),
    ResultScreen(),
    SportsScreen(),
    SportsScreen(),
    SportsScreen(),
  ];
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(margin: const EdgeInsets.only(bottom: 80),child: SizedBox(width: 50,height: 50,child: Image.asset("assets/png/chat_boat.png"),),),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Stack(
        children: [
          PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 45,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: InkWell(onTap: (){
                setState(() {
                  currentTab = 0;
                  currentScreen = DashboardScreen();
                });
               },child:SizedBox(
                width: size_80,
                height: size_80,
                child: Image.asset("assets/png/ic_floating.png"),
              )),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/png/bottom_bar.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              //children inside bottom appbar
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentTab = 1;
                            currentScreen = ResultScreen();
                          });
                        },
                        child: Image.asset("assets/png/ic_sports.png"),
                      ),
                      const Text(
                        "Sports",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentTab = 1;
                            currentScreen = screens[1];
                          });
                        },
                        child: Image.asset("assets/png/teams.png",width: 33,height: 33,),
                      ),
                      const Text(
                        "Teams",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          currentTab = 2;
                          currentScreen = ResultScreen();
                        },
                        child: Image.asset("assets/png/result.png"),
                      ),
                      const Text(
                        "Result",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5, right: 25),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          currentTab = 3;
                          currentScreen = screens[3];
                        },
                        child: Image.asset("assets/png/more.png"),
                      ),
                      const Text(
                        "More",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
