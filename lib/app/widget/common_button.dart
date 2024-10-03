import '../utils/all_imports.dart';

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final Color? backGroundColor;
  final Color? fontColor;
  final Color? borderColor;
  final String? buttonTitle;
  final String? fontFamily;
  final IconData? sufixIcon;
  final bool? isSufixIcon;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;

  const CommonButton({
    super.key,
    this.backGroundColor,
    this.buttonTitle,
    this.onTap,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.sufixIcon,
    this.fontColor,
    this.borderRadius,
    this.borderColor,
    this.isSufixIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 12.h),
        width: double.infinity,
        height: deviceType == DeviceTypes.Tablet
            ? 40
            : deviceType == DeviceTypes.Web
                ? 40
                : 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: borderColor ?? AppColors.transparent, width: 0.5.w),
          color: backGroundColor ?? AppColors.orange,
        ),
        alignment: Alignment.center,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                buttonTitle ?? "",
                textAlign: TextAlign.center,
                fontSize: fontSize ?? 16.sp,
                maxLines: 1,
                fontWeight: fontWeight ?? FontWeight.w700,
                fontFamily: fontFamily ?? FontFamily.bold,
                color: fontColor ?? AppColors.white,
              ),
              isSufixIcon!
                  ? Padding(
                      padding: EdgeInsets.only(right: 3.w),
                      child: Icon(
                        sufixIcon!,
                        size: 11.w,
                        color: AppColors.white,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
