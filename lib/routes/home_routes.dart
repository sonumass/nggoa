import 'package:get/get.dart';
import 'package:nggoa/screen/home/home_screen.dart';
import 'package:nggoa/screen/splash/splash_screen.dart';
import 'package:nggoa/screen/tutorial/tutotial_screen.dart';

class HomePageRoutes {
  HomePageRoutes._();

  static List<GetPage> get routes =>
      [GetPage(name: HomePage.routeName, page: () => HomePage())];
}
