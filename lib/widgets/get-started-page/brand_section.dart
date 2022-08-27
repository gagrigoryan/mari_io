import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mari_io/widgets/get-started-page/animated_interests_card.dart';

import '../../styles/helpers.dart';
import '../circle-image/circle_image.dart';

class BrandSection extends StatefulWidget {
  const BrandSection({Key? key}) : super(key: key);

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    Timer(const Duration(milliseconds: 200),
        () => {_animationController.forward()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final String circleLogo =
        "assets/images/circled-logo${isDarkTheme ? "-dark" : ""}.png";
    const String image1 = "assets/images/get-started-1.png";
    const String image2 = "assets/images/get-started-2.png";
    const String image3 = "assets/images/get-started-3.png";
    const String musicIcon = "assets/svg/music.svg";
    const String artIcon = "assets/svg/art.svg";
    const String videoPurpleIcon = "assets/svg/video-purple.svg";
    const String videoPinkIcon = "assets/svg/video-pink.svg";

    return Stack(
      children: [
        FadeTransition(
          opacity: _animationController,
          child: Image.asset(
            circleLogo,
            width: sd.getWidth(240),
            height: sd.getWidth(240),
          ),
        ),
        AnimatedInterestsCard(
          controller: _animationController,
          index: 0,
          icon: SvgPicture.asset(musicIcon),
          left: 0,
          top: 0,
          transform:
              Matrix4.translationValues(sd.getWidth(-16), sd.getWidth(-2), 0),
        ),
        AnimatedInterestsCard(
          controller: _animationController,
          index: 1,
          icon: SvgPicture.asset(videoPurpleIcon),
          right: 0,
          top: 0,
          transform:
              Matrix4.translationValues(sd.getWidth(12), sd.getWidth(-12), 0),
        ),
        AnimatedInterestsCard(
          controller: _animationController,
          index: 2,
          icon: SvgPicture.asset(videoPinkIcon),
          left: 0,
          bottom: sd.getWidth(72),
          transform: Matrix4.translationValues(sd.getWidth(-32), 0, 0),
        ),
        AnimatedInterestsCard(
          controller: _animationController,
          index: 3,
          icon: SvgPicture.asset(artIcon),
          right: 0,
          bottom: sd.getWidth(52),
          transform: Matrix4.translationValues(sd.getWidth(20), 0, 0),
        ),
        Positioned(
          left: sd.getWidth(24),
          top: sd.getHeight(70),
          child: FadeTransition(
            opacity: _animationController,
            child: const CircleImage(image: AssetImage(image1)),
          ),
        ),
        Positioned(
          right: sd.getWidth(29),
          top: sd.getHeight(62),
          child: FadeTransition(
            opacity: _animationController,
            child: const CircleImage(image: AssetImage(image3)),
          ),
        ),
        Positioned(
          left: sd.getWidth(80),
          bottom: sd.getHeight(24),
          child: FadeTransition(
            opacity: _animationController,
            child: const CircleImage(image: AssetImage(image2)),
          ),
        ),
      ],
    );
  }
}
