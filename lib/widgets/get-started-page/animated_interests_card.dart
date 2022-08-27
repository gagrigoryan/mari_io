import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'interests_card.dart';

class AnimatedInterestsCard extends StatelessWidget {
  final SvgPicture icon;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final Matrix4? transform;
  final AnimationController controller;
  final int index;

  const AnimatedInterestsCard(
      {Key? key,
      required this.icon,
      this.top,
      this.left,
      this.bottom,
      this.right,
      this.transform,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _animationStart = 0.1 * index;
    double _animationEnd = _animationStart + 0.5;

    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Transform(
        transform: transform ?? Matrix4.translationValues(0, 0, 0),
        child: SlideTransition(
          position: Tween<Offset>(
                  begin: const Offset(0, 1.3), end: const Offset(0, 0))
              .animate(CurvedAnimation(
                  parent: controller,
                  curve: Interval(_animationStart, _animationEnd,
                      curve: Curves.ease))),
          child: FadeTransition(
            opacity: CurvedAnimation(
                parent: controller,
                curve: Interval(_animationStart, _animationEnd,
                    curve: Curves.ease)),
            child: InterestsCard(
              icon: icon,
            ),
          ),
        ),
      ),
    );
  }
}
