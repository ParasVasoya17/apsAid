import '../utils/all_imports.dart';

class BaseController extends GetxController {
  GetStorageData getStorageData = GetStorageData();
// LoginData? loginData;
// @override
// void onInit() {
//   getUserData();
//   super.onInit();
// }
//
// getUserData() async {
//   if (getStorageData.containKey(getStorageData.loginData)) {
//     loginData = LoginData.fromJson(getStorageData.readObject(getStorageData.loginData));
//     printAction("userId =-=-=-=-=-=-=-=-> ${loginData!.userId!.toString()}");
//     printAction("$loginData");
//   }
// }
}
