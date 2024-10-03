import '../utils/all_imports.dart';

//ignore: must_be_immutable
class CommonTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String?)? onSaved;

  final Function(String)? onFieldSubmitted;

  final String? hintText;
  final String? labelText;
  final String? prefixIcon;
  final String? title;
  bool isTitle;
  final Widget? suffixIcon;
  final bool isMaxLines;
  final bool isMinLines;
  final bool isMaxLength;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Color? titleColor;
  final Color? fillColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool autofocus;
  bool enabled;
  bool obscureText;

  TextCapitalization textCapitalization;
  bool suffixVisibility;

  CommonTextFiled({
    super.key,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.onSaved,
    this.onFieldSubmitted,
    this.isMaxLength = false,
    this.maxLength,
    this.isMaxLines = false,
    this.maxLines,
    this.isMinLines = false,
    this.minLines,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixVisibility = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.titleColor,
    this.fillColor,
    this.borderColor,
    this.title = "",
    this.textCapitalization = TextCapitalization.none,
    this.isTitle = true,
    this.titleFontWeight = FontWeight.w500,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  State<CommonTextFiled> createState() => _CommonTextFiledState();
}

class _CommonTextFiledState extends State<CommonTextFiled> {
  toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle
            ? AppText(
                widget.title ?? "",
                fontSize: 16.sp,
                textAlign: TextAlign.start,
                fontFamily: FontFamily.medium,
                color: widget.titleColor ?? AppColors.secondaryBlue950,
                fontWeight: widget.titleFontWeight ?? FontWeight.w500,
              )
            : Container(),
        widget.isTitle ? 8.verticalSpace : 0.verticalSpace,
        Container(
          height: 40,
          child: TextFormField(
            controller: widget.controller,
            textCapitalization: widget.textCapitalization,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            textInputAction: widget.textInputAction,
            maxLines: widget.isMaxLines ? widget.maxLines : null,
            minLines: widget.isMinLines ? widget.minLines : null,
            maxLength: widget.isMaxLength ? widget.maxLength : null,
            enabled: widget.enabled,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            autofocus: widget.autofocus,
            onEditingComplete: widget.onEditingComplete,
            onSaved: widget.onSaved,
            onFieldSubmitted: widget.onFieldSubmitted,
            style: const TextStyle(
              color: AppColors.blackText,
              fontFamily: FontFamily.regular,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              counterText: "",
              hintText: widget.hintText ?? "",
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: isWeb ? EdgeInsets.only(left: 10, right: 7) : EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            widget.prefixIcon!,
                            height: 20,
                            width: 20,
                            color: AppColors.secondaryBlue700,
                          ),
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: VerticalDivider(
                              thickness: 1,
                              width: 1,
                              color: AppColors.disableBorder,
                            ),
                          ),
                        ],
                      ),
                    ),
              suffixIcon: widget.suffixVisibility == false
                  ? widget.suffixIcon
                  : Visibility(
                      visible: widget.suffixVisibility,
                      child: GestureDetector(
                        onTap: toggle,
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Image.asset(
                            widget.obscureText ? AppImages.icEyeClosed : AppImages.icEye,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      )),
              labelText: widget.labelText,
              hintStyle: TextStyle(
                color: AppColors.greyText,
                fontFamily: FontFamily.regular,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(
                color: AppColors.blackText,
                fontFamily: FontFamily.medium,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: isWeb ? EdgeInsets.zero : EdgeInsets.symmetric(vertical: 15.h, horizontal: widget.prefixIcon == null ? 15.w : 2.w),
              fillColor: widget.fillColor ?? AppColors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: widget.borderColor ?? AppColors.disableBorder),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: widget.borderColor ?? AppColors.disableBorder),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: widget.borderColor ?? AppColors.orange),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: widget.borderColor ?? AppColors.disableBorder),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//ignore: must_be_immutable
class CommonMultiLineTextFiled extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final String? prefixIcon;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool isMaxLines;
  final int? maxLines;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  bool enabled;
  bool obscureText;
  bool suffixVisibility;

  CommonMultiLineTextFiled({
    super.key,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.isMaxLines = false,
    this.maxLines,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixVisibility = false,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.fillColor,
    this.suffixText,
  });

  @override
  State<CommonMultiLineTextFiled> createState() => _CommonMultiLineTextFiledState();
}

class _CommonMultiLineTextFiledState extends State<CommonMultiLineTextFiled> {
  toggle() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      maxLines: widget.isMaxLines ? widget.maxLines : null,
      enabled: widget.enabled,
      style: TextStyle(
        color: AppColors.secondaryBlue950,
        fontFamily: FontFamily.regular,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText ?? "",
        prefixIcon: widget.prefixIcon == null
            ? null
            : Padding(
                padding: EdgeInsets.only(left: 15.w, right: 10.w),
                child: Image.asset(
                  widget.prefixIcon!,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
        suffixIcon: widget.suffixVisibility == false
            ? widget.suffixIcon
            : Visibility(
                visible: widget.suffixVisibility,
                child: GestureDetector(
                  onTap: toggle,
                  child: Container(
                    margin: EdgeInsets.all(14.sp),
                    child: Image.asset(
                      widget.obscureText ? AppImages.icEye : AppImages.icEyeClosed,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                )),
        labelText: widget.labelText ?? "",
        hintStyle: TextStyle(
          color: AppColors.secondaryBlue700,
          fontFamily: FontFamily.regular,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: AppColors.secondaryBlue950,
          fontFamily: FontFamily.medium,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixText: widget.suffixText ?? "",
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: widget.prefixIcon == null ? 15.w : 2.w),
        fillColor: widget.fillColor ?? AppColors.lightWhite,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
