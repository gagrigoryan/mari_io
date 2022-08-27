import 'package:flutter/material.dart';
import 'package:mari_io/styles/colors.dart';

import '../../styles/helpers.dart';

class CircleImage extends StatelessWidget {
  final AssetImage image;

  const CircleImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: sd.getWidth(40),
      height: sd.getWidth(40),
      decoration: BoxDecoration(
          border: Border.all(
              color: isDarkTheme ? AppColors.grey700 : AppColors.white,
              width: 2),
          borderRadius: BorderRadius.circular(48.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, sd.getWidth(4)),
              spreadRadius: 0,
              blurRadius: sd.getWidth(16),
              color: isDarkTheme
                  ? const Color.fromRGBO(107, 114, 128, 0.08)
                  : const Color.fromRGBO(255, 255, 255, 0.8),
            )
          ]),
      child: CircleAvatar(
        radius: sd.getWidth(18),
        backgroundImage: image,
      ),
    );
  }
}
