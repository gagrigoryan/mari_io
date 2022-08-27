import 'package:flutter/material.dart';
import 'package:mari_io/styles/helpers.dart';

import '../../styles/colors.dart';

class ButtonStyles {
  ButtonStyle primaryButton(ScreenDimension sd) {
    return ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
              vertical: sd.getHeight(17), horizontal: sd.getWidth(16)),
        ),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sd.getWidth(16)),
        )));
  }

  ButtonStyle outlinedButton(ScreenDimension sd) {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sd.getWidth(16)),
      ),
      primary: AppColors.primary,
      side: const BorderSide(color: AppColors.primary),
    );
  }

  ButtonStyle outlinedButtonWithIcon(ScreenDimension sd,
      {bool isDark = false}) {
    return OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(
          vertical: sd.getHeight(17), horizontal: sd.getWidth(20)),
      backgroundColor: isDark ? AppColors.grey800 : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(sd.getWidth(16)),
      ),
      primary: isDark ? AppColors.white : AppColors.textBlack,
      side: BorderSide(color: isDark ? AppColors.grey800 : AppColors.grey200),
    );
  }

  TextStyle textWithIcon(ScreenDimension sd, {bool isDark = false}) {
    return TextStyle(
        fontSize: sd.getWidth(14),
        height: 1,
        color: isDark ? AppColors.white : AppColors.textBlack,
        fontWeight: FontWeight.w500);
  }
}
