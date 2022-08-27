import 'package:flutter/material.dart';
import 'package:mari_io/widgets/typography/app_text.dart';

import '../../styles/colors.dart';

class AppLink extends StatelessWidget {
  final String value;
  final FontWeight fontWeight;
  final VoidCallback? onPressed;

  const AppLink(
      {Key? key,
      required this.value,
      this.fontWeight = FontWeight.w500,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: AppText(
          value: value,
          fontWeight: fontWeight,
          color: AppColors.primary,
        ));
  }
}
