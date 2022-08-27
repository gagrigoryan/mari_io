import 'package:flutter/material.dart';
import 'package:mari_io/styles/colors.dart';

import '../../styles/helpers.dart';

class AppText extends StatelessWidget {
  final String value;
  final TextAlign textAlign;
  final double? width;
  final bool? isLight;
  final Color? color;
  final FontWeight fontWeight;

  const AppText(
      {Key? key,
      required this.value,
      this.textAlign = TextAlign.left,
      this.width,
      this.isLight,
      this.color,
      this.fontWeight = FontWeight.w400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: width,
      child: Text(
        value,
        textAlign: textAlign,
        style: TextStyle(
            height: 1.5,
            fontSize: sd.getWidth(14),
            fontWeight: fontWeight,
            fontFamily: "NotoSansJP",
            color: color ??
                ((isLight ?? false)
                    ? AppColors.textGray
                    : isDarkTheme
                        ? AppColors.grey50
                        : AppColors.textBlack)),
      ),
    );
  }
}
