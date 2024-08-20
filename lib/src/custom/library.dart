import 'package:app_test/src/pages/home_page.dart';
import 'package:app_test/src/pages/splash_page.dart';
import 'package:flutter/material.dart';

enum CustomPage {
  splash,
  home,
}

enum TypeAnimation {
  transition,
}

BuildContext? globalContext;

navigate(BuildContext mContext, CustomPage mPage, {bool finishCurrent = false}) {
  if (finishCurrent) {
    Navigator.pop(globalContext!);
  }

  switch (mPage) {
    case CustomPage.splash:
      Navigator.pushAndRemoveUntil(globalContext!, _goPage(const SplashPage(), TypeAnimation.transition, 500), (Route<dynamic> route) => false);
      break;

    case CustomPage.home:
      Navigator.pushAndRemoveUntil(globalContext!, _goPage(const HomePage(), TypeAnimation.transition, 500), (Route<dynamic> route) => false);
      break;
    default:
  }
}

Route _goPage(Widget page, TypeAnimation type, int milliseconds) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: milliseconds),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final mCurveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInBack);

        switch (type) {
          case TypeAnimation.transition:
            return SlideTransition(
              position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(mCurveAnimation),
              child: child,
            );
        }
      });
}
