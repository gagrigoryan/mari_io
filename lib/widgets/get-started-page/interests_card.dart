import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mari_io/styles/colors.dart';

import '../../styles/helpers.dart';

class InterestsCard extends StatelessWidget {
  final SvgPicture icon;

  const InterestsCard({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Container(
        width: sd.getWidth(112),
        height: sd.getWidth(40),
        padding: EdgeInsets.only(
            left: sd.getWidth(8),
            top: sd.getWidth(8),
            bottom: sd.getWidth(8),
            right: sd.getWidth(16)),
        decoration: BoxDecoration(
            color: isDarkTheme ? AppColors.grey700 : AppColors.white,
            border: Border.all(
              color: const Color.fromRGBO(17, 24, 39, 0.02),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(1000)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, sd.getWidth(2)),
                spreadRadius: 0,
                blurRadius: sd.getWidth(32),
                color: const Color.fromRGBO(107, 114, 128, 0.04),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sd.getWidth(4),
                ),
                Container(
                  width: sd.getWidth(56),
                  height: sd.getWidth(6),
                  decoration: BoxDecoration(
                      color:
                          isDarkTheme ? AppColors.grey600 : AppColors.grey100,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                ),
                SizedBox(
                  height: sd.getWidth(4),
                ),
                Container(
                  width: sd.getWidth(35),
                  height: sd.getWidth(6),
                  decoration: BoxDecoration(
                      color:
                          isDarkTheme ? AppColors.grey600 : AppColors.grey100,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                ),
              ],
            )
          ],
        ));
  }
}
