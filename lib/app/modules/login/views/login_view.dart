import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/all_imports.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      assignId: true,
      init: LoginController(),
      builder: (controller) {
        print(MediaQuery.of(context).size.width);
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
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                _buildPasswordWidget(controller),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPasswordWidget(LoginController controller) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;

    if (screenWidth >= webScreenWidth) {
      return Center(child: _buildWebWidget(controller));
    } else if (screenWidth >= tabletScreenWidth) {
      return Center(child: _buildTabletWidget(controller));
    } else {
      return _buildMobileWidget(controller);
    }
  }

  Widget _buildMobileWidget(LoginController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                AppStrings.hey,
                fontSize: 30.sp,
                fontFamily: FontFamily.bold,
                color: AppColors.blackText,
                fontWeight: FontWeight.w700,
              ),
              AppText(
                AppStrings.loginSignup,
                fontSize: 30.sp,
                fontFamily: FontFamily.bold,
                color: AppColors.blackText,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 14.h),
              AppText(
                AppStrings.pleaseEnterYourValidEmailAddress,
                fontSize: 16.sp,
                fontFamily: FontFamily.regular,
                color: AppColors.greyText,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 18.h),
              CommonTextFiled(
                hintText: AppStrings.email,
                controller: controller.emailController,
                prefixIcon: AppImages.icEmail,
              ),
              SizedBox(height: 40.h),
              CommonButton(
                buttonTitle: AppStrings.continues,
                onTap: () {
                  if (controller.isValidation()) {
                    Get.toNamed(Routes.OTP, arguments: [controller.emailController.text]);
                  }
                },
              ),
              500.verticalSpace,
            ],
          ),
        ),

        // SizedBox(height: 200.h),
      ],
    );
  }

  Widget _buildTabletWidget(LoginController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
              shape: BoxShape.rectangle,
              color: AppColors.fillColor,
              backgroundBlendMode: BlendMode.screen,
              border: Border.all(color: AppColors.fillColor, width: 0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
            margin: EdgeInsets.zero,
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  "${AppStrings.hey} ${AppStrings.loginSignup}",
                  fontSize: 14,
                  fontFamily: FontFamily.semiBold,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 6.h),
                AppText(
                  AppStrings.pleaseEnterYourValidEmailAddress,
                  fontSize: 8,
                  fontFamily: FontFamily.regular,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 6.h),
                CommonTextFiled(
                  hintText: AppStrings.email,
                  controller: controller.emailController,
                  prefixIcon: AppImages.icEmail,
                ),
                SizedBox(height: 30.h),
                CommonButton(
                  buttonTitle: AppStrings.continues,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {
                      Get.toNamed(Routes.OTP, arguments: [controller.emailController.text]);
                    }
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
          // SizedBox(height: 200.h),
        ],
      ),
    );
  }

  Widget _buildWebWidget(LoginController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 400.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                  "${AppStrings.hey} ${AppStrings.loginSignup}",
                  fontSize: 20,
                  fontFamily: FontFamily.semiBold,
                  color: AppColors.blackText,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 6.h),
                AppText(
                  AppStrings.pleaseEnterYourValidEmailAddress,
                  fontSize: 15,
                  fontFamily: FontFamily.regular,
                  color: AppColors.greyText,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 5.h),
                CommonTextFiled(
                  hintText: AppStrings.email,
                  controller: controller.emailController,
                  prefixIcon: AppImages.icEmail,
                ),
                SizedBox(height: 25.h),
                CommonButton(
                  buttonTitle: AppStrings.continues,
                  fontSize: 16,
                  fontFamily: FontFamily.semiBold,
                  onTap: () {
                    if (controller.isValidation()) {
                      Get.toNamed(Routes.OTP, arguments: [controller.emailController.text]);
                    }
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),

          // SizedBox(height: 200.h),
        ],
      ),
    );
  }
}
