import '../utils/all_imports.dart';

class TimePickerThemeDataHelper {
  static ThemeData getTimePickerTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryBlue200, // header background color
        onPrimary: AppColors.secondaryBlue950, // header text color
        surface: AppColors.white, // background color
        onSurface: AppColors.secondaryBlue950, // text color
      ),
      fontFamily: FontFamily.regular,
      focusColor: AppColors.secondaryBlue700,
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.secondaryBlue950 : AppColors.primaryBlue200,
        ),
        dialBackgroundColor: WidgetStateColor.resolveWith(
          (states) => AppColors.primaryBlue200,
        ),
        hourMinuteColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.secondaryBlue950 : AppColors.primaryBlue200,
        ),
        hourMinuteTextColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.white : AppColors.secondaryBlue950,
        ),
        entryModeIconColor: AppColors.primaryBlue200,
        dayPeriodTextColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.white : AppColors.secondaryBlue950,
        ),
        helpTextStyle: TextStyle(
          color: AppColors.secondaryBlue950,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          fontFamily: FontFamily.bold,
        ),
        dialHandColor: AppColors.secondaryBlue950,
        dialTextColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.selected) ? AppColors.white : AppColors.secondaryBlue950,
        ),
        dialTextStyle: TextStyle(
          fontFamily: FontFamily.bold,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        dayPeriodTextStyle: TextStyle(
          fontFamily: FontFamily.bold,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        dayPeriodBorderSide: const BorderSide(
          color: AppColors.primaryBlue700,
          strokeAlign: BorderSide.strokeAlignInside,
          style: BorderStyle.solid,
          width: 0,
        ),
        timeSelectorSeparatorColor: WidgetStateColor.resolveWith(
          (states) => AppColors.secondaryBlue950,
        ),
        hourMinuteShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        cancelButtonStyle: ButtonStyle(
          foregroundColor: WidgetStateColor.resolveWith((states) => AppColors.secondaryBlue500),
          textStyle: WidgetStateTextStyle.resolveWith(
            (states) => TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.semiBold,
              color: AppColors.secondaryBlue500,
            ),
          ),
          splashFactory: NoSplash.splashFactory,
          padding: WidgetStatePropertyAll(
            EdgeInsets.only(top: 35.h),
          ),
          overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
          alignment: Alignment.topCenter,
        ),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: WidgetStateColor.resolveWith(
            (states) => AppColors.secondaryBlue950,
          ),
          textStyle: WidgetStateTextStyle.resolveWith(
            (states) => TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.bold,
              color: AppColors.secondaryBlue950,
            ),
          ),
          splashFactory: NoSplash.splashFactory,
          padding: WidgetStatePropertyAll(
            EdgeInsets.only(top: 35.h),
          ),
          overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
          alignment: Alignment.topCenter,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.secondaryBlue950,
          textStyle: TextStyle(
            color: AppColors.secondaryBlue950,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            fontFamily: FontFamily.bold,
          ),
        ),
      ),
    );
  }
}
