// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mari_io/styles/colors.dart';

import '../../styles/helpers.dart';

enum HeadingType {
  HeadingH1,
  HeadingH2,
  HeadingH3,
  HeadingH4,
  HeadingH5,
  HeadingH6
}

class Heading extends StatelessWidget {
  final String value;
  final HeadingType type;
  final TextAlign textAlign;

  const Heading(
      {Key? key,
      required this.value,
      this.type = HeadingType.HeadingH1,
      this.textAlign = TextAlign.left})
      : super(key: key);

  static const _fontSizes = {
    HeadingType.HeadingH1: 48.0,
    HeadingType.HeadingH2: 40.0,
    HeadingType.HeadingH3: 32.0,
    HeadingType.HeadingH4: 24.0,
    HeadingType.HeadingH5: 20.0,
    HeadingType.HeadingH6: 18.0,
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final fontSize = _fontSizes[type] as double;

    return Text(value,
        textAlign: textAlign,
        style: TextStyle(
            height: 1.5,
            fontFamily: "NotoSansJP",
            fontSize: sd.getWidth(fontSize),
            color: isDarkTheme ? AppColors.grey50 : AppColors.textBlack,
            fontWeight: FontWeight.bold));
  }
}
