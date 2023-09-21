import '../dio_client.dart';
class LoginApiServices extends DioClient {
  final client = DioClient.client;

/*  Future<LoginResponseDataModel?> loginApi(String username, String password,
      String type) async {
    String inputData = jsonEncode(
        LoginInputModel(username: username, password: password, type: type));

    debugPrint('inputData: $inputData');
    LoginResponseDataModel? loginModel;
    try {
      final response = await client.post(
          "${Constant.baseUrl}/broking/api/bdm_login",
          data: inputData,
          options: getBroKingHeader());
      if (kDebugMode) {
        print('inputData: $inputData');
        print('outPut: ${response.data}');
      }
      try {
        loginModel = LoginResponseDataModel.fromJson(jsonDecode(response.data));
      } catch (e) {
        debugPrint(e.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return loginModel;
  }*/
}