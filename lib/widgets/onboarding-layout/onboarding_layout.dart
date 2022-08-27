import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mari_io/widgets/app-link/app_link.dart';
import 'package:mari_io/widgets/typography/app_text.dart';
import 'package:mari_io/widgets/typography/heading.dart';
import 'package:mari_io/widgets/wide-button/wide_button.dart';

import '../../styles/helpers.dart';

class OnBoardingLayout extends StatefulWidget {
  final String title;
  final String description;
  final Widget child;
  final VoidCallback? onNext;
  final String? buttonText;

  const OnBoardingLayout(
      {Key? key,
      required this.title,
      required this.description,
      required this.child,
      this.onNext,
      this.buttonText})
      : super(key: key);

  @override
  State<OnBoardingLayout> createState() => _OnBoardingLayoutState();
}

class _OnBoardingLayoutState extends State<OnBoardingLayout>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    Timer(const Duration(milliseconds: 200),
        () => {_animationController.forward()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenDimension sd = ScreenDimension(size);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: sd.getHeight(64),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Theme.of(context).brightness,
            statusBarBrightness: Theme.of(context).brightness,
          ),
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  right: sd.getWidth(25), top: sd.getHeight(24)),
              child: AppLink(
                value: "SKIP",
                onPressed: () {
                  Navigator.pushNamed(context, '/get-started');
                },
              ),
            )
          ],
          titleSpacing: 20,
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: sd.getWidth(24),
              right: sd.getWidth(24),
              bottom: sd.getHeight(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0, -0.5),
                            end: const Offset(0, 0))
                        .animate(CurvedAnimation(
                            parent: _animationController,
                            curve: const Interval(0.1, 0.5,
                                curve: Curves.easeOut))),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: SizedBox(
                        width: sd.getWidth(288),
                        child: Heading(
                          value: widget.title,
                          type: HeadingType.HeadingH4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sd.getHeight(16),
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(0, -1.5),
                            end: const Offset(0, 0))
                        .animate(CurvedAnimation(
                            parent: _animationController,
                            curve:
                                const Interval(0, 0.5, curve: Curves.easeOut))),
                    child: FadeTransition(
                        opacity: _animationController,
                        child: AppText(
                          value: widget.description,
                          isLight: true,
                        )),
                  )
                ],
              ),
              widget.child,
              WideButton(
                value: widget.buttonText ?? "Continue",
                onPressed: widget.onNext,
              )
            ],
          ),
        ));
  }
}
