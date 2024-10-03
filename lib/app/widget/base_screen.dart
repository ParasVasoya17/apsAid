import '../utils/all_imports.dart';

class CommonScreen extends StatelessWidget {
  final Widget? body;
  final Widget? child;
  final Widget? bottomBar;
  final Widget? floatingActionButton;
  final bool? isFloatingActionButton;
  final bool? isSafeArea;
  final bool? isBottomBar;
  final bool? isAppBar;
  final bool? isLeading;
  final bool? isCenter;
  final bool? isExtendedAppBar;
  final bool isBackButton;
  final String? title;
  final Color? textColor;
  final Color? backGroundColor;
  final Color? appbarBgColor;
  final String? bgImage;
  final List<Widget>? action;
  final Widget? titleWidget;
  final Widget? suffix;
  final double? prefSize;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final PreferredSizeWidget? myAppBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CommonScreen({
    super.key,
    this.body,
    this.isSafeArea = true,
    this.isAppBar = true,
    this.isBottomBar = false,
    this.isFloatingActionButton = false,
    this.bottomBar,
    this.floatingActionButton,
    this.isLeading,
    this.isCenter = true,
    this.title,
    this.textColor,
    this.backGroundColor,
    this.child,
    this.appbarBgColor,
    this.isExtendedAppBar,
    this.action,
    this.onTap,
    this.onSuffixTap,
    this.bgImage,
    this.isBackButton = true,
    this.titleWidget,
    this.suffix,
    this.prefSize,
    this.myAppBar,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    Helper.darkStatusBar();
    return GestureDetector(
      onTap: () => helper.hideKeyboard(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor ?? AppColors.whiteBG,
        extendBodyBehindAppBar: isExtendedAppBar ?? true,
        extendBody: true,
        appBar: !isAppBar!
            ? null
            : myAppBar ??
                CommonAppBar(
                  isCenter: isCenter,
                  isLeading: isLeading,
                  title: title,
                  titleWidget: titleWidget,
                  suffix: suffix,
                  textColor: textColor,
                  appbarBgColor: appbarBgColor,
                  action: action,
                  onTap: onTap,
                  onSuffixTap: onSuffixTap,
                  isBackButton: isBackButton,
                  prefSize: prefSize,
                ),
        bottomNavigationBar: !isBottomBar! ? null : bottomBar,
        floatingActionButton: !isFloatingActionButton! ? null : floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
          top: isSafeArea!,
          bottom: false,
          child: body ??
              Container(
                height: Get.height,
                width: Get.width,
                alignment: Alignment.topCenter,
                decoration: bgImage != null
                    ? BoxDecoration(
                        image: DecorationImage(image: AssetImage(bgImage!), fit: BoxFit.fill, alignment: Alignment.topCenter),
                      )
                    : BoxDecoration(
                        image: DecorationImage(
                            image: icBackground,
                            // image: AssetImage(AppImages.icBackground),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter),
                      ),
                child: child,
              ),
        ),
      ),
    );
  }
}
