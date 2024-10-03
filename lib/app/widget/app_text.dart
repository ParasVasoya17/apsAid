import '../utils/all_imports.dart';

class AppText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final TextDecoration textDecoration;
  final TextAlign textAlign;
  final int maxLines;
  final FontStyle fontStyle;

  const AppText(
    this.text, {
    super.key,
    this.fontSize = 28,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.letterSpacing,
    this.textDecoration = TextDecoration.none,
    this.textAlign = TextAlign.start,
    this.height = 0,
    this.maxLines = 1000,
    this.fontStyle = FontStyle.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        height: height,
        color: color ?? AppColors.blackText,
        fontFamily: fontFamily ?? FontFamily.medium,
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
    );
  }
}
