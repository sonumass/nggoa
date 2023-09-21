import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:nggoa/routes/home_routes.dart';
import 'package:nggoa/routes/splash_routes.dart';
import 'package:nggoa/routes/tutorial_routes.dart';
class Routes {
  Routes._();

  static List<GetPage> get() {
    final moduleRoutes = <GetPage>[];
    moduleRoutes.addAll(SplashScreenRoutes.routes);
    moduleRoutes.addAll(TutorialScreenRoutes.routes);
    moduleRoutes.addAll(HomePageRoutes.routes);

    return moduleRoutes;
  }
}
