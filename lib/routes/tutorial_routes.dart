import 'package:get/get.dart';
import 'package:nggoa/screen/splash/splash_screen.dart';
import 'package:nggoa/screen/tutorial/tutotial_screen.dart';

class TutorialScreenRoutes {
  TutorialScreenRoutes._();

  static List<GetPage> get routes =>
      [GetPage(name: TutorialPage.routeName, page: () => TutorialPage())];
}
