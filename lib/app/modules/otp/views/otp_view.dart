import 'package:pinput/pinput.dart';

import '../../../utils/all_imports.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      assignId: true,
      init: OtpController(),
      builder: (controller) {
        return CommonScreen(
          isAppBar: false,
          isBackButton: false,
          isBottomBar: false,
          isExtendedAppBar: true,
          isSafeArea: false,
          title: "",
          backGroundColor: AppColors.transparent,
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [
                _buildOtpWidget(controller, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOtpWidget(OtpController controller, BuildContext context) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;

    if (screenWidth >= webScreenWidth) {
      return Center(child: _buildWebWidget(controller, context));
    } else if (screenWidth >= tabletScreenWidth) {
      return Center(child: _buildTabletWidget(controller, context));
    } else {
      return Center(child: _buildMobileWidget(controller, context));
    }
  }

  Widget _buildMobileWidget(OtpController controller, BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 0.12.sw,
      height: 0.12.sw,
      textStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.semiBold,
        color: AppColors.blackText,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.disableBorder),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.transparent,
            border: Border(
              left: BorderSide(
                color: AppColors.transparent,
                width: 0,
              ),
              top: BorderSide(
                color: AppColors.transparent,
                width: 0,
              ),
              right: BorderSide(
                color: AppColors.transparent,
                width: 0,
              ),
              bottom: BorderSide(
                color: AppColors.fillColor,
                width: 0,
              ),
            ),
          ),
          child: Image.asset(
            AppImages.icTopLogoDesign,
          ),
        ),

        Container(
          decoration: BoxDecoration(
            color: AppColors.fillColor,
            border: Border.all(color: AppColors.white, width: 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          margin: EdgeInsets.zero,
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppStrings.codeVerification,
                fontSize: 30.sp,
                fontFamily: FontFamily.bold,
                color: AppColors.blackText,
                fontWeight: FontWeight.w700,
              ),
              6.verticalSpace,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.regular,
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " ${controller.email.value}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semiBold,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              22.verticalSpace,
              Center(
                child: Form(
                  key: controller.otpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: controller.pinController,
                          focusNode: controller.focusNode,
                          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          keyboardType: TextInputType.number,
                          length: 6,
                          followingPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          separatorBuilder: (index) => SizedBox(width: 10.w),
                          validator: (value) {
                            return value!.isNotEmpty ? null : 'Pin is incorrect';
                          },
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                            // controller.isFrom.isNotEmpty ? Get.offAllNamed(Routes.LOGIN) : Get.toNamed(Routes.CREATE_PASSWORD);
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                          disabledPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              22.verticalSpace,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.youCanRequestAnotherCode,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.regular,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " ${controller.formatTime(controller.seconds)}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semiBold,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " ${AppStrings.minutes}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.regular,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              CommonButton(
                buttonTitle: AppStrings.logInUsingCode,
                onTap: () {
                  if (controller.pinController.text.isNotEmpty) {
                    Get.toNamed(Routes.PASSWORD);
                  } else {
                    helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                  }
                },
              ),
              18.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.disableBorder,
                      thickness: 0.5.w,
                      endIndent: 10,
                    ),
                  ),
                  AppText(
                    AppStrings.or,
                    fontSize: 14.sp,
                    textAlign: TextAlign.center,
                    fontFamily: FontFamily.regular,
                    color: AppColors.blackText,
                    fontWeight: FontWeight.w400,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5.w,
                      indent: 10,
                      color: AppColors.disableBorder,
                    ),
                  ),
                ],
              ),
              18.verticalSpace,
              CommonButton(
                backGroundColor: AppColors.transparent,
                borderColor: AppColors.orange,
                fontColor: AppColors.orange,
                buttonTitle: AppStrings.logInUsingPassword,
                onTap: () {
                  if (controller.pinController.text.isNotEmpty) {
                    Get.toNamed(Routes.PASSWORD);
                  } else {
                    helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                  }
                },
              ),
              20.verticalSpace,
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.enteredWrongEmailAddress,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.regular,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " ${AppStrings.changeEmailAddress}",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontFamily.semiBold,
                          color: AppColors.orange,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              250.verticalSpace,
            ],
          ),
        ),
        // SizedBox(height: 200.h),
      ],
    );
  }

  Widget _buildTabletWidget(OtpController controller, BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 0.07.sw,
      height: 0.07.sw,
      textStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.semiBold,
        color: AppColors.blackText,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.disableBorder),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.transparent,
              border: Border(
                left: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                top: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                right: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                bottom: BorderSide(
                  color: AppColors.fillColor,
                  width: 0,
                ),
              ),
            ),
            child: Image.asset(
              AppImages.icTopLogoDesign,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.fillColor,
              border: Border.all(color: AppColors.white, width: 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            margin: EdgeInsets.zero,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  AppStrings.codeVerification,
                  fontSize: 14.sp,
                  fontFamily: FontFamily.bold,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${controller.email.value}",
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
                Center(
                  child: Form(
                    key: controller.otpFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            controller: controller.pinController,
                            focusNode: controller.focusNode,
                            androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            keyboardType: TextInputType.number,
                            length: 6,
                            followingPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            separatorBuilder: (index) => SizedBox(width: 10.w),
                            validator: (value) {
                              return value!.isNotEmpty ? null : 'Pin is incorrect';
                            },
                            onCompleted: (pin) {
                              debugPrint('onCompleted: $pin');
                              // controller.isFrom.isNotEmpty ? Get.offAllNamed(Routes.LOGIN) : Get.toNamed(Routes.CREATE_PASSWORD);
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: AppColors.orange,
                                ),
                              ),
                            ),
                            disabledPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                12.verticalSpace,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.youCanRequestAnotherCode,
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${controller.formatTime(controller.seconds)}",
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " ${AppStrings.minutes}",
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                12.verticalSpace,
                CommonButton(
                  buttonTitle: AppStrings.logInUsingCode,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.pinController.text.isNotEmpty) {
                      Get.toNamed(Routes.PASSWORD);
                    } else {
                      helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                    }
                  },
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.disableBorder,
                        thickness: 0.5.w,
                        endIndent: 10,
                      ),
                    ),
                    AppText(
                      AppStrings.or,
                      fontSize: 6.sp,
                      textAlign: TextAlign.center,
                      fontFamily: FontFamily.regular,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5.w,
                        indent: 10,
                        color: AppColors.disableBorder,
                      ),
                    ),
                  ],
                ),
                18.verticalSpace,
                CommonButton(
                  backGroundColor: AppColors.transparent,
                  borderColor: AppColors.orange,
                  fontColor: AppColors.orange,
                  buttonTitle: AppStrings.logInUsingPassword,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.pinController.text.isNotEmpty) {
                      Get.toNamed(Routes.PASSWORD);
                    } else {
                      helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                    }
                  },
                ),
                16.verticalSpace,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.enteredWrongEmailAddress,
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${AppStrings.changeEmailAddress}",
                          style: TextStyle(
                            fontSize: 6.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebWidget(OtpController controller, BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      // width: 0.038.sw,
      // height: 0.038.sw,
      textStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: FontFamily.semiBold,
        color: AppColors.blackText,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.disableBorder),
      ),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 400.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.transparent,
              border: Border(
                left: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                top: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                right: BorderSide(
                  color: AppColors.transparent,
                  width: 0,
                ),
                bottom: BorderSide(
                  color: AppColors.fillColor,
                  width: 0,
                ),
              ),
            ),
            child: Image.asset(
              AppImages.icTopLogoDesign,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.fillColor,
              border: Border.all(color: AppColors.white, width: 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            margin: EdgeInsets.zero,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  AppStrings.codeVerification,
                  fontSize: 20,
                  fontFamily: FontFamily.bold,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                ),
                2.verticalSpace,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontFamily.regular,
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${controller.email.value}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                8.verticalSpace,
                Center(
                  child: Form(
                    key: controller.otpFormKey,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          controller: controller.pinController,
                          focusNode: controller.focusNode,
                          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: defaultPinTheme,
                          keyboardType: TextInputType.number,
                          length: 6,
                          followingPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          separatorBuilder: (index) => SizedBox(width: 20.w),
                          validator: (value) {
                            return value!.isNotEmpty ? null : 'Pin is incorrect';
                          },
                          onCompleted: (pin) {
                            debugPrint('onCompleted: $pin');
                            // controller.isFrom.isNotEmpty ? Get.offAllNamed(Routes.LOGIN) : Get.toNamed(Routes.CREATE_PASSWORD);
                          },
                          onChanged: (value) {
                            debugPrint('onChanged: $value');
                          },
                          focusedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                          submittedPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: AppColors.orange,
                              ),
                            ),
                          ),
                          disabledPinTheme: defaultPinTheme.copyWith(
                            decoration: defaultPinTheme.decoration!.copyWith(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                          errorPinTheme: defaultPinTheme.copyBorderWith(
                            border: Border.all(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                10.verticalSpace,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.youCanRequestAnotherCode,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${controller.formatTime(controller.seconds)}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: " ${AppStrings.minutes}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                16.verticalSpace,
                CommonButton(
                  buttonTitle: AppStrings.logInUsingCode,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.pinController.text.isNotEmpty) {
                      Get.toNamed(Routes.PASSWORD);
                    } else {
                      helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                    }
                  },
                ),
                14.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.disableBorder,
                        thickness: 0.5.w,
                        endIndent: 10,
                      ),
                    ),
                    AppText(
                      AppStrings.or,
                      fontSize: 12.sp,
                      textAlign: TextAlign.center,
                      fontFamily: FontFamily.regular,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400,
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5.w,
                        indent: 10,
                        color: AppColors.disableBorder,
                      ),
                    ),
                  ],
                ),
                14.verticalSpace,
                CommonButton(
                  backGroundColor: AppColors.transparent,
                  borderColor: AppColors.orange,
                  fontColor: AppColors.orange,
                  buttonTitle: AppStrings.logInUsingPassword,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.pinController.text.isNotEmpty) {
                      Get.toNamed(Routes.PASSWORD);
                    } else {
                      helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
                    }
                  },
                ),
                16.verticalSpace,
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppStrings.enteredWrongEmailAddress,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontFamily.regular,
                            color: AppColors.blackText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${AppStrings.changeEmailAddress}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: FontFamily.semiBold,
                            color: AppColors.orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:pinput/pinput.dart';
//
// import '../../../utils/all_imports.dart';
// import '../controllers/otp_controller.dart';
//
// class OtpView extends GetView<OtpController> {
//   const OtpView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OtpController>(
//       assignId: true,
//       init: OtpController(),
//       builder: (controller) {
//         return CommonScreen(
//           isAppBar: false,
//           isBackButton: false,
//           isBottomBar: false,
//           isExtendedAppBar: true,
//           isSafeArea: false,
//           title: "",
//           backGroundColor: AppColors.transparent,
//           child: Scaffold(
//             backgroundColor: AppColors.transparent,
//             body: ListView(
//               children: [
//                 isWeb ? 100.verticalSpace : 100.verticalSpace,
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     if (constraints.maxWidth > 500) {
//                       final defaultPinTheme = PinTheme(
//                         width: 0.04.sw,
//                         height: 0.04.sw,
//                         // width: 0.05.sw,
//                         // height: 0.05.sw,
//                         // width: 60.w,
//                         // height: 60.w,
//                         textStyle: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: FontFamily.semiBold,
//                           color: AppColors.blackText,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.r),
//                           border: Border.all(color: AppColors.disableBorder),
//                         ),
//                       );
//                       return Center(child: webWidget(controller, context, defaultPinTheme));
//                     } else {
//                       final defaultPinTheme = PinTheme(
//                         width: 0.12.sw,
//                         height: 0.12.sw,
//                         textStyle: TextStyle(
//                           fontSize: 22.sp,
//                           fontWeight: FontWeight.w600,
//                           fontFamily: FontFamily.semiBold,
//                           color: AppColors.blackText,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.r),
//                           border: Border.all(color: AppColors.disableBorder),
//                         ),
//                       );
//                       return Center(child: mobileWidget(controller, context, defaultPinTheme));
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget mobileWidget(OtpController controller, BuildContext context, PinTheme defaultPinTheme) {
//     return Container(
//       width: double.infinity,
//
//       // width: 728.w,
//       // height: 1103.h,
//       padding: EdgeInsets.symmetric(horizontal: 24.w),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             AppImages.icAuthBg,
//           ),
//           fit: BoxFit.fill,
//         ),
//       ),
//       alignment: Alignment.topCenter,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           490.verticalSpace,
//           AppText(
//             AppStrings.codeVerification,
//             fontSize: 28.sp,
//             fontFamily: FontFamily.bold,
//             color: AppColors.blackText,
//             fontWeight: FontWeight.w700,
//           ),
//           18.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.greyText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${controller.email.value}",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           30.verticalSpace,
//           Center(
//             child: Form(
//               key: controller.otpFormKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Directionality(
//                     textDirection: TextDirection.ltr,
//                     child: Pinput(
//                       controller: controller.pinController,
//                       focusNode: controller.focusNode,
//                       androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
//                       listenForMultipleSmsOnAndroid: true,
//                       defaultPinTheme: defaultPinTheme,
//                       keyboardType: TextInputType.number,
//                       length: 6,
//                       followingPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(15.r),
//                         ),
//                       ),
//                       separatorBuilder: (index) => SizedBox(width: 10.w),
//                       validator: (value) {
//                         return value!.isNotEmpty ? null : 'Pin is incorrect';
//                       },
//                       onCompleted: (pin) {
//                         debugPrint('onCompleted: $pin');
//                         // controller.isFrom.isNotEmpty ? Get.offAllNamed(Routes.LOGIN) : Get.toNamed(Routes.CREATE_PASSWORD);
//                       },
//                       onChanged: (value) {
//                         debugPrint('onChanged: $value');
//                       },
//                       focusedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(15.r),
//                           border: Border.all(
//                             color: AppColors.orange,
//                           ),
//                         ),
//                       ),
//                       submittedPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(15.r),
//                           border: Border.all(
//                             color: AppColors.orange,
//                           ),
//                         ),
//                       ),
//                       disabledPinTheme: defaultPinTheme.copyWith(
//                         decoration: defaultPinTheme.decoration!.copyWith(
//                           color: AppColors.white,
//                           borderRadius: BorderRadius.circular(15.r),
//                         ),
//                       ),
//                       errorPinTheme: defaultPinTheme.copyBorderWith(
//                         border: Border.all(color: Colors.redAccent),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           18.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.youCanRequestAnotherCode,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${controller.formatTime(controller.seconds)}",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${AppStrings.minutes}",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           20.verticalSpace,
//           CommonButton(
//             buttonTitle: AppStrings.logInUsingCode,
//             onTap: () {
//               if (controller.pinController.text.isNotEmpty) {
//                 Get.toNamed(Routes.PASSWORD);
//               } else {
//                 helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
//               }
//             },
//           ),
//           18.verticalSpace,
//           Row(
//             children: [
//               Expanded(
//                 child: Divider(
//                   color: AppColors.disableBorder,
//                   thickness: 0.5.w,
//                   endIndent: 10,
//                 ),
//               ),
//               AppText(
//                 AppStrings.or,
//                 fontSize: 14.sp,
//                 textAlign: TextAlign.center,
//                 fontFamily: FontFamily.regular,
//                 color: AppColors.blackText,
//                 fontWeight: FontWeight.w400,
//               ),
//               Expanded(
//                 child: Divider(
//                   thickness: 0.5.w,
//                   indent: 10,
//                   color: AppColors.disableBorder,
//                 ),
//               ),
//             ],
//           ),
//           18.verticalSpace,
//           CommonButton(
//             backGroundColor: AppColors.transparent,
//             borderColor: AppColors.orange,
//             fontColor: AppColors.orange,
//             buttonTitle: AppStrings.logInUsingPassword,
//             onTap: () {
//               if (controller.pinController.text.isNotEmpty) {
//                 Get.toNamed(Routes.PASSWORD);
//               } else {
//                 helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
//               }
//             },
//           ),
//           20.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.enteredWrongEmailAddress,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${AppStrings.changeEmailAddress}",
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.orange,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           200.verticalSpace,
//         ],
//       ),
//     );
//   }
//
//   Widget webWidget(OtpController controller, BuildContext context, PinTheme defaultPinTheme) {
//     return Container(
//       width: 500.w,
//       // width: 580.w,
//       // height: 680.h,
//
//       // width: 703.w,
//       // height: 751.h,
//       padding: EdgeInsets.symmetric(horizontal: 30.w),
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage(
//               AppImages.icAuthBg,
//             ),
//             fit: BoxFit.fill),
//       ),
//       alignment: Alignment.topCenter,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           240.verticalSpace,
//           // 220.verticalSpace,
//           AppText(
//             AppStrings.codeVerification,
//             fontSize: 24.sp,
//             fontFamily: FontFamily.bold,
//             color: AppColors.blackText,
//             fontWeight: FontWeight.w700,
//           ),
//           14.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.greyText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${controller.email.value}",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           20.verticalSpace,
//           Center(
//             child: Form(
//               key: controller.otpFormKey,
//               child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Directionality(
//                   textDirection: TextDirection.ltr,
//                   child: Pinput(
//                     controller: controller.pinController,
//                     focusNode: controller.focusNode,
//                     androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
//                     listenForMultipleSmsOnAndroid: true,
//                     defaultPinTheme: defaultPinTheme,
//                     keyboardType: TextInputType.number,
//                     length: 6,
//                     followingPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(15.r),
//                       ),
//                     ),
//                     separatorBuilder: (index) => SizedBox(width: 20.w),
//                     validator: (value) {
//                       return value!.isNotEmpty ? null : 'Pin is incorrect';
//                     },
//                     onCompleted: (pin) {
//                       debugPrint('onCompleted: $pin');
//                       // controller.isFrom.isNotEmpty ? Get.offAllNamed(Routes.LOGIN) : Get.toNamed(Routes.CREATE_PASSWORD);
//                     },
//                     onChanged: (value) {
//                       debugPrint('onChanged: $value');
//                     },
//                     focusedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(15.r),
//                         border: Border.all(
//                           color: AppColors.orange,
//                         ),
//                       ),
//                     ),
//                     submittedPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(15.r),
//                         border: Border.all(
//                           color: AppColors.orange,
//                         ),
//                       ),
//                     ),
//                     disabledPinTheme: defaultPinTheme.copyWith(
//                       decoration: defaultPinTheme.decoration!.copyWith(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(15.r),
//                       ),
//                     ),
//                     errorPinTheme: defaultPinTheme.copyBorderWith(
//                       border: Border.all(color: Colors.redAccent),
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           ),
//           14.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.youCanRequestAnotherCode,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${controller.formatTime(controller.seconds)}",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${AppStrings.minutes}",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           16.verticalSpace,
//           CommonButton(
//             buttonTitle: AppStrings.logInUsingCode,
//             fontSize: 18.sp,
//             fontFamily: FontFamily.semiBold,
//             onTap: () {
//               if (controller.pinController.text.isNotEmpty) {
//                 Get.toNamed(Routes.PASSWORD);
//               } else {
//                 helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
//               }
//             },
//           ),
//           14.verticalSpace,
//           Row(
//             children: [
//               Expanded(
//                 child: Divider(
//                   color: AppColors.disableBorder,
//                   thickness: 0.5.w,
//                   endIndent: 10,
//                 ),
//               ),
//               AppText(
//                 AppStrings.or,
//                 fontSize: 12.sp,
//                 textAlign: TextAlign.center,
//                 fontFamily: FontFamily.regular,
//                 color: AppColors.blackText,
//                 fontWeight: FontWeight.w400,
//               ),
//               Expanded(
//                 child: Divider(
//                   thickness: 0.5.w,
//                   indent: 10,
//                   color: AppColors.disableBorder,
//                 ),
//               ),
//             ],
//           ),
//           14.verticalSpace,
//           CommonButton(
//             backGroundColor: AppColors.transparent,
//             borderColor: AppColors.orange,
//             fontColor: AppColors.orange,
//             buttonTitle: AppStrings.logInUsingPassword,
//             fontSize: 18.sp,
//             fontFamily: FontFamily.semiBold,
//             onTap: () {
//               if (controller.pinController.text.isNotEmpty) {
//                 Get.toNamed(Routes.PASSWORD);
//               } else {
//                 helper.showToast(message: AppStrings.errorMessageEnterOtp, context: context);
//               }
//             },
//           ),
//           16.verticalSpace,
//           Center(
//             child: RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: AppStrings.enteredWrongEmailAddress,
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.regular,
//                       color: AppColors.blackText,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   TextSpan(
//                     text: " ${AppStrings.changeEmailAddress}",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontFamily: FontFamily.semiBold,
//                       color: AppColors.orange,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           20.verticalSpace,
//         ],
//       ),
//     );
//   }
// }
//
