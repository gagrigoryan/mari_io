import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mari_io/services/local_auth_api.dart';
import 'package:mari_io/widgets/typography/heading.dart';

import '../../styles/colors.dart';
import '../../styles/helpers.dart';

class LocalAuth extends StatefulWidget {
  const LocalAuth({Key? key}) : super(key: key);

  @override
  State<LocalAuth> createState() => _LocalAuthState();
}

class _LocalAuthState extends State<LocalAuth> {
  @override
  void initState() {
    LocalAuthApi.authenticate().then((isAuthenticated) => {
          if (isAuthenticated)
            {
              Timer(const Duration(milliseconds: 1000),
                  () => Navigator.popAndPushNamed(context, "/onboarding/1"))
            }
        });
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final String backgroundImage =
        "assets/images/local-auth${isDarkTheme ? "-dark" : ""}.png";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: isDarkTheme ? AppColors.grey900 : AppColors.white,
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarBrightness: Theme.of(context).brightness,
          )),
      body: Container(
        padding: EdgeInsets.all(sd.getWidth(42)),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              backgroundImage,
              width: sd.getWidth(220),
              height: sd.getWidth(136),
            ),
            SizedBox(
              height: sd.getHeight(48),
            ),
            SizedBox(
              width: sd.getWidth(280),
              child: const Heading(
                value: "You can log in with biometric data",
                type: HeadingType.HeadingH5,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
