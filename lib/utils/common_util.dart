import 'dart:convert';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Common {
  static Options getOptions(String authToken) {
    return Options(headers: {"Authorization": authToken, "device": "mobile"});
  }
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    //return Toast.show(message, duration: Toast.lengthShort, gravity:  Toast.bottom);
  }


  static Future<String> getAppCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    //String currentAppVersion = "$version.$buildNumber";
    return buildNumber;
  }

  static Future<String?> getDeviceId() async {
    String id = Random(1000).toString();
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      id = iosDeviceInfo.isPhysicalDevice.toString();
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      id = androidDeviceInfo.androidId ?? "";
      return id; // unique ID on Android
    }
    return id;
  }

  static String dateParsing(String date) {
    DateFormat newDateFormat = DateFormat("DD-MM-yyyy");
    DateTime dateTime = DateFormat("yyyy-mm-ddThh:mm:ss").parse(date);
    String selectedDate = newDateFormat.format(dateTime);
    return selectedDate;
  }

  static Future<void> deleteDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('delete_title'.tr),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('delete_msg'.tr),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('yes'.tr),
              onPressed: () {
                print('Confirmed');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('no'.tr),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static String? readByteConvertBase64(String path){
    try{
      var file= File.fromUri(Uri.parse(path));
      List<int> bytes = file.readAsBytesSync();
      return base64UrlEncode(bytes).toString();
    }catch(e){
      debugPrint(e.toString());
      return null;
    }

  }
  static Future<void> share({linkUrl,title,chooserTitle,text}) async {
    await FlutterShare.share(
        title: title??"",
        text: text??"",
        linkUrl: linkUrl??"",
        chooserTitle: chooserTitle??""
    );
  }

}
