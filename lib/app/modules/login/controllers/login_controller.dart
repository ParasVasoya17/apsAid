import 'package:aps_aide/app/utils/all_imports.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();

  /// validation
  bool isValidation() {
    if (helper.isValidationEmpty(emailController.text.trim())) {
      helper.showSnackBar(context: Get.context!, message: AppStrings.errorMessageEmail);
      return false;
    } else if (!helper.emailValidator(emailController.text.trim())) {
      helper.showSnackBar(context: Get.context!, message: AppStrings.errorMessageValidEmail);
      return false;
    }
    return true;
  }
}
