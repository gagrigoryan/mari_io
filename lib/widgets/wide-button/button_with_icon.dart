import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/helpers.dart';
import 'button_styles.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? value;
  final double width;
  final SvgPicture icon;

  const ButtonWithIcon(
      {Key? key,
      this.onPressed,
      required this.icon,
      this.value,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    ButtonStyles styles = ButtonStyles();

    return SizedBox(
        width: width,
        height: sd.getHeight(56),
        child: OutlinedButton(
          style: styles.outlinedButtonWithIcon(sd, isDark: isDarkTheme),
          onPressed: onPressed,
          child: Stack(
            children: <Widget>[
              Align(alignment: Alignment.centerLeft, child: icon),
              Align(
                alignment: Alignment.center,
                child: Text(
                  value ?? "",
                  style: styles.textWithIcon(sd, isDark: isDarkTheme),
                ),
              )
            ],
          ),
        ));
  }
}
