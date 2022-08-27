import 'package:flutter/material.dart';
import 'package:mari_io/widgets/onboarding-layout/onboarding_layout.dart';
import 'package:mari_io/widgets/onboarding-page/onboarding-image.dart';

import '../../styles/helpers.dart';

class OnBoardingStep1 extends StatelessWidget {
  const OnBoardingStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final backgroundImage =
        "assets/images/onboarding-1${isDarkTheme ? "-dark" : ""}.png";
    const String image1 = "assets/images/onboarding-stage-1.png";
    const String image2 = "assets/images/onboarding-stage-2.png";
    const String image3 = "assets/images/onboarding-stage-3.png";

    return OnBoardingLayout(
      title: "Discover great events at your fingertips",
      description:
          "Find and attend events that fuel their passions. From music festivals, arts, conferences, and fundraisers, to gaming competitions.",
      onNext: () {
        Navigator.pushNamed(context, '/onboarding/2');
      },
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.translationValues(
                sd.getWidth(-24), sd.getHeight(-24), 0),
            child: Image.asset(
              backgroundImage,
              width: sd.getWidth(304),
              height: sd.getWidth(294),
            ),
          ),
          OnBoardingImage(
              index: 0,
              left: sd.getWidth(40),
              transform: Matrix4.translationValues(0, sd.getHeight(-20), 0),
              image: Image.asset(
                image1,
                width: sd.getWidth(174),
                height: sd.getWidth(121),
                fit: BoxFit.cover,
              )),
          OnBoardingImage(
              index: 1,
              left: sd.getWidth(20),
              bottom: 0,
              transform: Matrix4.translationValues(0, sd.getHeight(-16), 0),
              image: Image.asset(
                image2,
                width: sd.getWidth(119),
                height: sd.getWidth(160),
                fit: BoxFit.cover,
              )),
          OnBoardingImage(
              index: 2,
              right: sd.getWidth(16),
              top: sd.getWidth(36),
              // transform: Matrix4.translationValues(0, sd.getHeight(-16), 0),
              image: Image.asset(
                image3,
                width: sd.getWidth(139),
                height: sd.getWidth(188),
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
