import 'package:aps_aide/main_controller.dart';
import 'package:flutter/foundation.dart';

import 'app/utils/all_imports.dart';

getDeviceType(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  if (screenWidth > 800) {
    isWeb = true;
    deviceType = DeviceTypes.Web;
  } else if (screenWidth > 451) {
    isWeb = true;
    deviceType = DeviceTypes.Tablet;
  } else {
    isWeb = false;
    deviceType = DeviceTypes.Phone;
  }
  icBackground = AssetImage(isWeb ? AppImages.icLoginBgWeb : AppImages.icLoginBgMob);

  print("deviceType=-=-=-=-=-=-=-=-=-=-=-=->>${deviceType}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends GetView<MainController> {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getDeviceType(context);

    Helper.screenPortrait();
    Helper.lightStatusBar();
    return GetBuilder<MainController>(
      assignId: true,
      init: MainController(),
      builder: (controller) {
        return ScreenUtilInit(
          // designSize: const Size(420, 1280),
          designSize: deviceType == DeviceTypes.Web ? const Size(1440, 832) : const Size(420, 1280),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              builder: EasyLoading.init(
                builder: (context, child) {
                  return MediaQuery.withNoTextScaling(child: child!);
                },
              ),
            );
          },
        );
      },
    );
  }
}
