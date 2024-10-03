import 'package:get/get.dart';

import '../../../utils/all_imports.dart';

class PasswordController extends GetxController {
  RxString email = "".obs;

  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.value = Get.arguments[0];
    }

    super.onInit();
  }

  /// validation
  bool isValidation() {
    if (helper.isValidationEmpty(passwordController.text.trim())) {
      helper.showSnackBar(context: Get.context!, message: AppStrings.errorMessagePassword);
      return false;
    } else if (!helper.passwordValidator((passwordController.text.trim()))) {
      helper.showSnackBar(context: Get.context!, message: AppStrings.errorMessageValidPassword);
      return false;
    }

    return true;
  }
}
