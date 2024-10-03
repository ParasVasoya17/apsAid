import '../../../utils/all_imports.dart';
import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(
      assignId: true,
      init: PasswordController(),
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
            body: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                _buildLoginWidget(controller),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoginWidget(PasswordController controller) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;

    if (screenWidth >= webScreenWidth) {
      return Center(child: _buildWebWidget(controller));
    } else if (screenWidth >= tabletScreenWidth) {
      return Center(child: _buildTabletWidget(controller));
    } else {
      return _buildMobileWidget(controller);
    }
  }

  Widget _buildMobileWidget(PasswordController controller) {
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
                AppStrings.password,
                fontSize: 30.sp,
                fontFamily: FontFamily.bold,
                color: AppColors.blackText,
                fontWeight: FontWeight.w700,
              ),
              8.verticalSpace,
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
              20.verticalSpace,
              CommonTextFiled(
                hintText: AppStrings.password,
                controller: controller.passwordController,
                prefixIcon: AppImages.icLock,
                obscureText: true,
                maxLines: 1,
                isMaxLines: true,
                suffixVisibility: true,
              ),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppText(
                    AppStrings.forgetPassword,
                    fontSize: 14.sp,
                    fontFamily: FontFamily.regular,
                    color: AppColors.blackText,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              20.verticalSpace,
              CommonButton(
                buttonTitle: AppStrings.logInUsingCode,
                onTap: () {
                  if (controller.isValidation()) {}
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
                buttonTitle: AppStrings.logInUsingCode,
                onTap: () {
                  if (controller.isValidation()) {
                    Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
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
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              250.verticalSpace
            ],
          ),
        ),
        // SizedBox(height: 200.h),
      ],
    );
  }

  Widget _buildTabletWidget(PasswordController controller) {
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
                  AppStrings.password,
                  fontSize: 14.sp,
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
                CommonTextFiled(
                  hintText: AppStrings.password,
                  controller: controller.passwordController,
                  prefixIcon: AppImages.icLock,
                  obscureText: true,
                  maxLines: 1,
                  isMaxLines: true,
                  suffixVisibility: true,
                ),
                12.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      AppStrings.forgetPassword,
                      fontSize: 6.sp,
                      fontFamily: FontFamily.regular,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                12.verticalSpace,
                CommonButton(
                  buttonTitle: AppStrings.logInUsingCode,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {}
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
                  buttonTitle: AppStrings.logInUsingCode,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {
                      Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
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
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                30.verticalSpace
              ],
            ),
          ),
          // SizedBox(height: 200.h),
        ],
      ),
    );
  }

  Widget _buildWebWidget(PasswordController controller) {
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
                  AppStrings.password,
                  fontSize: 20,
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
                            fontSize: 15,
                            fontFamily: FontFamily.regular,
                            color: AppColors.greyText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: " ${controller.email.value}",
                          style: TextStyle(
                            fontSize: 12,
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
                  child: CommonTextFiled(
                    hintText: AppStrings.password,
                    controller: controller.passwordController,
                    prefixIcon: AppImages.icLock,
                    obscureText: true,
                    maxLines: 1,
                    isMaxLines: true,
                    suffixVisibility: true,
                  ),
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText(
                      AppStrings.forgetPassword,
                      fontSize: 12.sp,
                      fontFamily: FontFamily.regular,
                      color: AppColors.blackText,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
                16.verticalSpace,
                CommonButton(
                  buttonTitle: AppStrings.logInUsingPassword,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {}
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
                  buttonTitle: AppStrings.logInUsingCode,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {
                      Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
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
                            decoration: TextDecoration.underline,
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

// import '../../../utils/all_imports.dart';
// import '../controllers/password_controller.dart';
//
// class PasswordView extends GetView<PasswordController> {
//   const PasswordView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<PasswordController>(
//       assignId: true,
//       init: PasswordController(),
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
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               children: [
//                 deviceType == DeviceTypes.Web
//                     ? 140.verticalSpace
//                     : deviceType == DeviceTypes.Tablet
//                         ? 145.verticalSpace
//                         : 150.verticalSpace,
//                 _buildLoginWidget(controller),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildLoginWidget(PasswordController controller) {
//     final screenWidth = MediaQuery.of(Get.context!).size.width;
//
//     if (screenWidth >= webScreenWidth) {
//       return Center(child: _buildWebWidget(controller));
//     } else if (screenWidth >= tabletScreenWidth) {
//       return Center(child: _buildTabletWidget(controller));
//     } else {
//       return _buildMobileWidget(controller);
//     }
//   }
//
//   Widget _buildMobileWidget(PasswordController controller) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // SizedBox(height: 350.h),
//         Image.asset(
//           AppImages.icTopLogoDesign,
//           width: double.infinity,
//           fit: BoxFit.fitWidth,
//         ),
//         Container(
//           decoration: BoxDecoration(
//             color: AppColors.fillColor,
//             border: Border.all(color: AppColors.fillColor, width: 0),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(5.r),
//               bottomRight: Radius.circular(5.r),
//             ),
//           ),
//           padding: EdgeInsets.symmetric(horizontal: 24.w),
//           margin: EdgeInsets.zero,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppText(
//                 AppStrings.password,
//                 fontSize: 30.sp,
//                 fontFamily: FontFamily.bold,
//                 color: AppColors.blackText,
//                 fontWeight: FontWeight.w700,
//               ),
//               8.verticalSpace,
//               Center(
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontFamily: FontFamily.regular,
//                           color: AppColors.greyText,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       TextSpan(
//                         text: " ${controller.email.value}",
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontFamily: FontFamily.semiBold,
//                           color: AppColors.blackText,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               20.verticalSpace,
//               CommonTextFiled(
//                 hintText: AppStrings.password,
//                 controller: controller.passwordController,
//                 prefixIcon: AppImages.icLock,
//                 obscureText: true,
//                 maxLines: 1,
//                 isMaxLines: true,
//                 suffixVisibility: true,
//               ),
//               16.verticalSpace,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   AppText(
//                     AppStrings.forgetPassword,
//                     fontSize: 14.sp,
//                     fontFamily: FontFamily.regular,
//                     color: AppColors.blackText,
//                     fontWeight: FontWeight.w400,
//                     textAlign: TextAlign.end,
//                   ),
//                 ],
//               ),
//               20.verticalSpace,
//               CommonButton(
//                 buttonTitle: AppStrings.logInUsingCode,
//                 onTap: () {
//                   if (controller.isValidation()) {}
//                 },
//               ),
//               18.verticalSpace,
//               Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: AppColors.disableBorder,
//                       thickness: 0.5.w,
//                       endIndent: 10,
//                     ),
//                   ),
//                   AppText(
//                     AppStrings.or,
//                     fontSize: 14.sp,
//                     textAlign: TextAlign.center,
//                     fontFamily: FontFamily.regular,
//                     color: AppColors.blackText,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   Expanded(
//                     child: Divider(
//                       thickness: 0.5.w,
//                       indent: 10,
//                       color: AppColors.disableBorder,
//                     ),
//                   ),
//                 ],
//               ),
//               18.verticalSpace,
//               CommonButton(
//                 backGroundColor: AppColors.transparent,
//                 borderColor: AppColors.orange,
//                 fontColor: AppColors.orange,
//                 buttonTitle: AppStrings.logInUsingCode,
//                 onTap: () {
//                   if (controller.isValidation()) {
//                     Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
//                   }
//                 },
//               ),
//               20.verticalSpace,
//               Center(
//                 child: RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: AppStrings.enteredWrongEmailAddress,
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontFamily: FontFamily.regular,
//                           color: AppColors.blackText,
//                           fontWeight: FontWeight.w400,
//                         ),
//                       ),
//                       TextSpan(
//                         text: " ${AppStrings.changeEmailAddress}",
//                         style: TextStyle(
//                           fontSize: 14.sp,
//                           fontFamily: FontFamily.semiBold,
//                           color: AppColors.orange,
//                           decoration: TextDecoration.underline,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               250.verticalSpace
//             ],
//           ),
//         ),
//         // SizedBox(height: 200.h),
//       ],
//     );
//   }
//
//   Widget _buildTabletWidget(PasswordController controller) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // SizedBox(height: 350.h),
//             Image.asset(
//               AppImages.icTopLogoDesign,
//               width: 350.w,
//               fit: BoxFit.fill,
//             ),
//             Container(
//               width: 350.w,
//               decoration: BoxDecoration(
//                 color: AppColors.fillColor,
//                 border: Border.all(color: AppColors.fillColor, width: 0),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(5.r),
//                   bottomRight: Radius.circular(5.r),
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               margin: EdgeInsets.zero,
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     AppStrings.password,
//                     fontSize: 14.sp,
//                     fontFamily: FontFamily.bold,
//                     color: AppColors.blackText,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   2.verticalSpace,
//                   Center(
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
//                             style: TextStyle(
//                               fontSize: 8.sp,
//                               fontFamily: FontFamily.regular,
//                               color: AppColors.greyText,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextSpan(
//                             text: " ${controller.email.value}",
//                             style: TextStyle(
//                               fontSize: 8.sp,
//                               fontFamily: FontFamily.semiBold,
//                               color: AppColors.blackText,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   12.verticalSpace,
//                   CommonTextFiled(
//                     hintText: AppStrings.password,
//                     controller: controller.passwordController,
//                     prefixIcon: AppImages.icLock,
//                     obscureText: true,
//                     maxLines: 1,
//                     isMaxLines: true,
//                     suffixVisibility: true,
//                   ),
//                   8.verticalSpace,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       AppText(
//                         AppStrings.forgetPassword,
//                         fontSize: 6.sp,
//                         fontFamily: FontFamily.regular,
//                         color: AppColors.blackText,
//                         fontWeight: FontWeight.w400,
//                         textAlign: TextAlign.end,
//                       ),
//                     ],
//                   ),
//                   12.verticalSpace,
//                   CommonButton(
//                     buttonTitle: AppStrings.logInUsingCode,
//                     fontSize: 16,
//                     fontFamily: FontFamily.semiBold,
//                     onTap: () {
//                       if (controller.isValidation()) {}
//                     },
//                   ),
//                   8.verticalSpace,
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: AppColors.disableBorder,
//                           thickness: 0.5.w,
//                           endIndent: 10,
//                         ),
//                       ),
//                       AppText(
//                         AppStrings.or,
//                         fontSize: 6.sp,
//                         textAlign: TextAlign.center,
//                         fontFamily: FontFamily.regular,
//                         color: AppColors.blackText,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5.w,
//                           indent: 10,
//                           color: AppColors.disableBorder,
//                         ),
//                       ),
//                     ],
//                   ),
//                   18.verticalSpace,
//                   CommonButton(
//                     backGroundColor: AppColors.transparent,
//                     borderColor: AppColors.orange,
//                     fontColor: AppColors.orange,
//                     buttonTitle: AppStrings.logInUsingCode,
//                     fontSize: 16,
//                     fontFamily: FontFamily.semiBold,
//                     onTap: () {
//                       if (controller.isValidation()) {
//                         Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
//                       }
//                     },
//                   ),
//                   16.verticalSpace,
//                   Center(
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: AppStrings.enteredWrongEmailAddress,
//                             style: TextStyle(
//                               fontSize: 6.sp,
//                               fontFamily: FontFamily.regular,
//                               color: AppColors.blackText,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextSpan(
//                             text: " ${AppStrings.changeEmailAddress}",
//                             style: TextStyle(
//                               fontSize: 6.sp,
//                               fontFamily: FontFamily.semiBold,
//                               color: AppColors.orange,
//                               decoration: TextDecoration.underline,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   30.verticalSpace
//                 ],
//               ),
//             ),
//             // SizedBox(height: 200.h),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildWebWidget(PasswordController controller) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // SizedBox(height: 350.h),
//             Image.asset(
//               AppImages.icTopLogoDesign,
//               width: 500.w,
//               fit: BoxFit.fill,
//             ),
//             Container(
//               width: 500.w,
//               decoration: BoxDecoration(
//                 color: AppColors.fillColor,
//                 border: Border.all(color: AppColors.fillColor, width: 0),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(5.r),
//                   bottomRight: Radius.circular(5.r),
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               margin: EdgeInsets.zero,
//               alignment: Alignment.topCenter,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   AppText(
//                     AppStrings.password,
//                     fontSize: 24.sp,
//                     fontFamily: FontFamily.bold,
//                     color: AppColors.blackText,
//                     fontWeight: FontWeight.w700,
//                   ),
//                   2.verticalSpace,
//                   Center(
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: AppStrings.pleaseEnterTheVerificationCodeWeHaveSentToTheEmailAddress,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: FontFamily.regular,
//                               color: AppColors.greyText,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextSpan(
//                             text: " ${controller.email.value}",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: FontFamily.semiBold,
//                               color: AppColors.blackText,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   8.verticalSpace,
//                   Center(
//                     child: CommonTextFiled(
//                       hintText: AppStrings.password,
//                       controller: controller.passwordController,
//                       prefixIcon: AppImages.icLock,
//                       obscureText: true,
//                       maxLines: 1,
//                       isMaxLines: true,
//                       suffixVisibility: true,
//                     ),
//                   ),
//                   10.verticalSpace,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       AppText(
//                         AppStrings.forgetPassword,
//                         fontSize: 12.sp,
//                         fontFamily: FontFamily.regular,
//                         color: AppColors.blackText,
//                         fontWeight: FontWeight.w400,
//                         textAlign: TextAlign.end,
//                       ),
//                     ],
//                   ),
//                   16.verticalSpace,
//                   CommonButton(
//                     buttonTitle: AppStrings.logInUsingPassword,
//                     fontSize: 16,
//                     fontFamily: FontFamily.semiBold,
//                     onTap: () {
//                       if (controller.isValidation()) {}
//                     },
//                   ),
//                   14.verticalSpace,
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: AppColors.disableBorder,
//                           thickness: 0.5.w,
//                           endIndent: 10,
//                         ),
//                       ),
//                       AppText(
//                         AppStrings.or,
//                         fontSize: 12.sp,
//                         textAlign: TextAlign.center,
//                         fontFamily: FontFamily.regular,
//                         color: AppColors.blackText,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5.w,
//                           indent: 10,
//                           color: AppColors.disableBorder,
//                         ),
//                       ),
//                     ],
//                   ),
//                   14.verticalSpace,
//                   CommonButton(
//                     backGroundColor: AppColors.transparent,
//                     borderColor: AppColors.orange,
//                     fontColor: AppColors.orange,
//                     buttonTitle: AppStrings.logInUsingCode,
//                     fontSize: 16,
//                     fontFamily: FontFamily.semiBold,
//                     onTap: () {
//                       if (controller.isValidation()) {
//                         Get.offAllNamed(Routes.OTP, arguments: [controller.email.value]);
//                       }
//                     },
//                   ),
//                   16.verticalSpace,
//                   Center(
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: AppStrings.enteredWrongEmailAddress,
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: FontFamily.regular,
//                               color: AppColors.blackText,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                           TextSpan(
//                             text: " ${AppStrings.changeEmailAddress}",
//                             style: TextStyle(
//                               fontSize: 12.sp,
//                               fontFamily: FontFamily.semiBold,
//                               color: AppColors.orange,
//                               decoration: TextDecoration.underline,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   20.verticalSpace,
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
