import 'dart:async';

import '../../../utils/all_imports.dart';

class OtpController extends GetxController {
  RxString email = "".obs;

  TextEditingController pinController = TextEditingController();
  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (Get.arguments != null) {
      email.value = Get.arguments[0];
    }
    _startTimer();

    super.onInit();
  }

  int seconds = 300; // 5 minutes in seconds
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        _timer?.cancel();
      }
      update();
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
