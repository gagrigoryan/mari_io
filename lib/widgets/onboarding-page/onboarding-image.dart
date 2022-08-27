import 'dart:async';

import 'package:flutter/material.dart';

class OnBoardingImage extends StatefulWidget {
  final Image image;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final Matrix4? transform;
  final int index;

  const OnBoardingImage(
      {Key? key,
      required this.image,
      this.top,
      this.left,
      this.bottom,
      this.right,
      this.transform,
      required this.index})
      : super(key: key);

  @override
  State<OnBoardingImage> createState() => _OnBoardingImageState();
}

class _OnBoardingImageState extends State<OnBoardingImage>
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
    double _animationStart = 0.1 * widget.index;
    double _animationEnd = _animationStart + 0.5;

    return Positioned(
        left: widget.left,
        top: widget.top,
        right: widget.right,
        bottom: widget.bottom,
        child: Transform(
          transform: widget.transform ?? Matrix4.translationValues(0, 0, 0),
          child: SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0, 1), end: const Offset(0, 0))
                  .animate(CurvedAnimation(
                      parent: _animationController,
                      curve: Interval(_animationStart, _animationEnd,
                          curve: Curves.ease))),
              child: FadeTransition(
                opacity: _animationController,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: widget.image,
                ),
              )),
        ));
  }
}
