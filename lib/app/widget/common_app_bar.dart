import '../utils/all_imports.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? isLeading;
  final bool? isCenter;
  final String? title;
  final Color? textColor;
  final Color? appbarBgColor;
  final List<Widget>? action;
  final bool isBackButton;
  final double? prefSize;
  final Widget? suffix;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final Widget? titleWidget;

  const CommonAppBar({
    super.key,
    this.isLeading,
    this.isCenter = true,
    this.title,
    this.textColor,
    this.appbarBgColor,
    this.action,
    this.onTap,
    this.onSuffixTap,
    this.suffix,
    this.isBackButton = true,
    this.titleWidget,
    this.prefSize,
  });

  // @override
  // Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    Helper.lightStatusBar();
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        // height: 102.h,
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isBackButton
                  ? GestureDetector(
                      onTap: onTap ??
                          () {
                            helper.hideKeyboard(context);
                            Get.back();
                          },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.only(left: 24.w, right: 10.w),
                        color: AppColors.transparent,
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          AppImages.icBack,
                          width: 30.w,
                        ),
                      ),
                    )
                  : Container(
                      height: 45.h,
                      padding: EdgeInsets.only(left: 24.w, right: 10.w),
                      color: AppColors.transparent,
                      alignment: Alignment.centerRight,
                      child: Container(width: 30.w),
                    ),
              Expanded(
                child: AppText(
                  title ?? "",
                  fontSize: 22.sp,
                  textAlign: TextAlign.center,
                  fontFamily: FontFamily.medium,
                  color: AppColors.secondaryBlue950,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: onSuffixTap ?? () {},
                child: Container(
                  padding: EdgeInsets.only(right: 24.w, left: 10.w),
                  color: AppColors.transparent,
                  height: 45.h,
                  child: suffix ?? Container(width: 30.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(prefSize ?? kToolbarHeight + 15.h);
}
