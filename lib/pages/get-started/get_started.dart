import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mari_io/styles/colors.dart';
import 'package:mari_io/widgets/app-link/app_link.dart';
import 'package:mari_io/widgets/get-started-page/brand_section.dart';
import 'package:mari_io/widgets/typography/app_text.dart';
import 'package:mari_io/widgets/wide-button/button_with_icon.dart';
import 'package:mari_io/widgets/wide-button/wide_button.dart';

import '../../styles/helpers.dart';
import '../../widgets/typography/heading.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    const String googleIcon = "assets/svg/gmail.svg";
    const String appleIcon = "assets/svg/apple.svg";

    return Scaffold(
      // backgroundColor: AppColors.white,
      appBar: AppBar(
          backgroundColor: isDarkTheme ? AppColors.grey900 : AppColors.white,
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarBrightness: Theme.of(context).brightness,
          )),
      bottomNavigationBar: BottomAppBar(
        color: isDarkTheme ? AppColors.grey900 : AppColors.white,
        elevation: 0,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
              top: sd.getHeight(16),
              left: sd.getWidth(24),
              right: sd.getWidth(24)),
          height: sd.getHeight(80),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppText(
                value: "Don’t have an account?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 5,
              ),
              AppLink(
                value: "Sign Up",
                fontWeight: FontWeight.bold,
                onPressed: () => {print("ok")},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.only(
              top: sd.getHeight(50),
              left: sd.getWidth(24),
              right: sd.getWidth(24)),
          child: SizedBox(
            width: double.infinity,
            height: sd.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    const Heading(
                      value: "Let’s Get Started",
                      type: HeadingType.HeadingH5,
                    ),
                    SizedBox(height: sd.getHeight(8)),
                    AppText(
                      value:
                          "Sign up or log in to see what happening near you.",
                      width: sd.getWidth(260),
                      textAlign: TextAlign.center,
                      isLight: true,
                    ),
                    SizedBox(height: sd.getHeight(16)),
                  ],
                ),
                const BrandSection(),
                Column(
                  children: [
                    WideButton(
                      value: 'Continue with Email',
                      onPressed: () => {},
                    ),
                    SizedBox(height: sd.getHeight(12)),
                    ButtonWithIcon(
                      value: "Continue with Google",
                      onPressed: () => {},
                      icon: SvgPicture.asset(googleIcon),
                    ),
                    SizedBox(height: sd.getHeight(12)),
                    ButtonWithIcon(
                      value: "Continue with Apple",
                      onPressed: () => {},
                      icon: SvgPicture.asset(
                        appleIcon,
                        color: isDarkTheme ? AppColors.white : null,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
