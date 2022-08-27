import 'package:flutter/material.dart';
import 'package:mari_io/widgets/onboarding-layout/onboarding_layout.dart';

import '../../styles/helpers.dart';
import '../../widgets/onboarding-page/onboarding-image.dart';

class OnBoardingStep2 extends StatelessWidget {
  const OnBoardingStep2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final backgroundImage =
        "assets/images/onboarding-2${isDarkTheme ? "-dark" : ""}.png";
    const String image1 = "assets/images/onboarding-stage-4.png";
    const String image2 = "assets/images/onboarding-stage-5.png";

    return OnBoardingLayout(
      title: "Follow your favorites about upcoming events",
      description:
          "Find and attend events that fuel their passions. From music festivals, arts, conferences, and fundraisers, to gaming competitions.",
      onNext: () {
        Navigator.pushNamed(context, '/get-started');
      },
      buttonText: "Get Started",
      child: Stack(
        children: [
          Transform(
            transform:
                Matrix4.translationValues(sd.getWidth(-24), sd.getHeight(0), 0),
            child: Image.asset(
              backgroundImage,
              width: sd.getWidth(287),
              height: sd.getWidth(294),
            ),
          ),
          OnBoardingImage(
              index: 0,
              left: sd.getWidth(8),
              top: 0,
              transform: Matrix4.translationValues(0, sd.getHeight(-16), 0),
              image: Image.asset(
                image1,
                width: sd.getWidth(131),
                height: sd.getWidth(237),
                fit: BoxFit.cover,
              )),
          OnBoardingImage(
              index: 1,
              right: 0,
              bottom: sd.getWidth(24),
              transform: Matrix4.translationValues(sd.getWidth(4), 0, 0),
              image: Image.asset(
                image2,
                width: sd.getWidth(131),
                height: sd.getWidth(237),
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
