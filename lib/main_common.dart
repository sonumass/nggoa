import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:nggoa/route.dart';
import 'package:nggoa/screen/splash/splash_screen.dart';
import 'package:nggoa/screen/tutorial/tutotial_screen.dart';
import 'package:nggoa/theme/my_theme.dart';
import 'package:nggoa/utils/translater.dart';
import 'bindings/initial_binding.dart';
import 'data/mapper/mapper.dart';
import 'environment.dart';
Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  MapperFactory.initialize();
  HttpOverrides.global = MyHttpOverrides();
  await Environment.initialize(env);
  debugPrint("MainCommon Env $env");
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await InitialBindings().dependencies();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(getMaterialApp);
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
GetMaterialApp get getMaterialApp => GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      navigatorObservers: [],
      translations: TranslateData(),
      locale: const Locale(
        'en',
        'US',
      ),
      fallbackLocale:
          const Locale.fromSubtags(languageCode: 'en', countryCode: ' US'),
      theme: ThemeData(
        primarySwatch: MyColors.appColor,
        fontFamily: "Encode Sans",
      ),
      getPages: Routes.get(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? Container(),
        );
      },
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: TutorialPage.routeName,
    );
