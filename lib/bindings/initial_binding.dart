import 'package:get/get.dart';
import 'package:nggoa/data/network/dio_client.dart';
import 'package:nggoa/data/preferences/AppPreferences.dart';
import 'package:nggoa/data/preferences/shared_preferences.dart';
import 'package:nggoa/utils/common_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    try {
      Get.put<AppPreferences>(
          AppPreferences(
              sharedPreferences: await SharedPreferences.getInstance()),
          permanent: true);
      Get.put<DioClient>(DioClient(), permanent: true);
      Get.put<SharedConfig>(SharedConfig(), permanent: true);
      Get.put<Common>(Common(), permanent: true);
    } catch (e) {
      print("Error in InitialBindings");
    }
  }
}
