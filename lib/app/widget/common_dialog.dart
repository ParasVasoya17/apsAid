import '../utils/all_imports.dart';

class CommonDialogBox extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final String imagePath;
  final VoidCallback onButtonTap;

  const CommonDialogBox({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.imagePath,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      child:
          // BackdropFilter(
          // filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          // child:
          Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(26.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 156.h,
              width: 160.w,
            ),
            16.verticalSpace,
            AppText(
              title,
              fontSize: 24.sp,
              textAlign: TextAlign.center,
              fontFamily: FontFamily.semiBold,
              color: AppColors.secondaryBlue950,
              fontWeight: FontWeight.w600,
            ),
            10.verticalSpace,
            AppText(
              message,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              fontFamily: FontFamily.light,
              height: 1.5,
              color: AppColors.secondaryBlue800,
              fontWeight: FontWeight.w300,
            ),
            22.verticalSpace,
            CommonButton(
              onTap: onButtonTap,
              buttonTitle: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
