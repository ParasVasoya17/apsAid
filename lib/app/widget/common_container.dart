import '../utils/all_imports.dart';

class CommonContainer extends StatelessWidget {
  final Widget? child;
  final bool? isHeight;
  final double? height;
  final bool? isWidth;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Color? color;
  final bool? isBorder;
  final Color? borderColor;
  final double? borderWidth;
  final bool? isBorderRadius;
  final bool? isBorderRadiusOnly;
  final double? borderRadius;
  final bool? isBoxShadow;
  final Color? boxShadowColor;
  final double? boxShadowBlurRadius;
  final double? boxShadowSpreadRadius;
  final Offset? boxShadowOffset;
  final DecorationImage? bgImage;
  final Gradient? gradient;
  final double? topLeft;
  final double? bottomLeft;
  final double? topRight;
  final double? bottomRight;

  const CommonContainer({
    super.key,
    this.child,
    this.isHeight = true,
    this.height,
    this.isWidth = false,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.isBorder = false,
    this.borderColor,
    this.borderWidth = 1,
    this.isBorderRadius = false,
    this.isBorderRadiusOnly = false,
    this.borderRadius = 10,
    this.isBoxShadow = false,
    this.boxShadowColor,
    this.boxShadowBlurRadius = 10,
    this.boxShadowSpreadRadius = 1.8,
    this.boxShadowOffset = Offset.zero,
    this.bgImage,
    this.gradient,
    this.topLeft,
    this.bottomLeft,
    this.topRight,
    this.bottomRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isHeight! ? height ?? 77.h : null,
      width: isWidth! ? width! : double.infinity,
      padding: padding,
      margin: margin,
      alignment: alignment,
      decoration: BoxDecoration(
        color: color ?? AppColors.white,
        image: bgImage,
        gradient: gradient,

        border: isBorder!
            ? Border.all(
                color: borderColor ?? AppColors.transparent,
                width: borderWidth!,
              )
            : null,
        borderRadius: isBorderRadius!
            ? isBorderRadiusOnly!
                ? BorderRadius.only(
                    topLeft: Radius.circular(topLeft ?? 0),
                    topRight: Radius.circular(topRight ?? 0),
                    bottomLeft: Radius.circular(bottomLeft ?? 0),
                    bottomRight: Radius.circular(bottomRight ?? 0),
                  )
                : BorderRadius.circular(borderRadius!)
            : BorderRadius.circular(12.r),
        // borderRadius: isBorderRadius! ? BorderRadius.circular(borderRadius!) : null,
      ),
      child: child,
    );
  }
}
