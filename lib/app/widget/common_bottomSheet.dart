import 'dart:ui';

import '../utils/all_imports.dart';

commonBottomSheet({
  required BuildContext context,
  required Widget child,
  required bool isDismissible,
}) {
  return showModalBottomSheet(
    isScrollControlled: false,
    isDismissible: isDismissible,
    backgroundColor: AppColors.transparent,
    constraints: BoxConstraints.loose(
      Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    ),
    context: context,
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return BackdropFilter(
        // blendMode: BlendMode.softLight,
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(42.r),
                  topRight: Radius.circular(42.r),
                ),
              ),
              child: child,
            ),
            // SizedBox(height: 5.h)
          ],
        ),
      );
    }),
  );
}
