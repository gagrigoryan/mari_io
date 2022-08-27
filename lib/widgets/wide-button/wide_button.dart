// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mari_io/styles/colors.dart';
import 'package:mari_io/widgets/wide-button/button_styles.dart';

import '../../styles/helpers.dart';

enum WideButtonType { Filled, Outlined }

class WideButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? value;
  final double width;
  final WideButtonType type;

  const WideButton(
      {Key? key,
      this.value,
      this.onPressed,
      this.width = double.infinity,
      this.type = WideButtonType.Filled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    ButtonStyles styles = ButtonStyles();

    return SizedBox(
        width: width,
        height: sd.getHeight(56),
        child: TextButton(
          style: type == WideButtonType.Filled
              ? styles.primaryButton(sd)
              : styles.outlinedButton(sd),
          onPressed: onPressed,
          child: Text(
            value ?? "",
            style: TextStyle(
                color: type == WideButtonType.Filled
                    ? AppColors.white
                    : AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: sd.getWidth(14),
                height: 1.5),
          ),
        ));
  }
}
