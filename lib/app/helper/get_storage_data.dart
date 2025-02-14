import 'dart:convert';

import '../utils/all_imports.dart';

/// <<< To store data in phone storage --------- >>>
class GetStorageData {
  String userData = "userData";
  String fcmToken = "fcmToken";
  String isAlreadySignUp = "isAlreadySignUp";

  /// <<< To save object data --------- >>>
  saveString(String key, value) async {
    final box = GetStorage();
    return box.write(key, value);
  }

  /// <<< To read object data --------- >>>
  readString(String key) {
    final box = GetStorage();
    if (box.hasData(key)) {
      return box.read(key);
    } else {
      return null;
    }
  }

  /// <<< To remove data --------- >>>
  removeData(String key) async {
    final box = GetStorage();
    return box.remove(key);
  }

  /// <<< To Store Key data --------- >>>
  bool containKey(String key) {
    final box = GetStorage();
    return box.hasData(key);
  }

  saveObject(String key, value) {
    final box = GetStorage();
    String allData = jsonEncode(value);
    box.write(key, allData);
  }

  readObject(String key) {
    final box = GetStorage();
    var result = box.read(key);
    return jsonDecode(result);
  }
}
