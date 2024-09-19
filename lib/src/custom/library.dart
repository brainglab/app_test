import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/pages/details_page.dart';
import 'package:app_test/src/pages/home_page.dart';
import 'package:app_test/src/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CustomPage {
  splash,
  home,
  details,
}

enum TypeAnimation {
  transition,
}

enum Preference {
  onboarding,
}

BuildContext? globalContext;

// Register the RouteObserver as a navigation observer.
final RouteObserver<ModalRoute<void>> mRouteObserver = RouteObserver<ModalRoute<void>>();

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

    case CustomPage.details:
      Navigator.push(globalContext!, _goPage(const DetailsPage(), TypeAnimation.transition, 500));
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

// para convertir un color hexadecimal en un color de flutter
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

setOnePreference(Preference mAuxKey, String value) async {
  String mKey = '';
  switch (mAuxKey) {
    case Preference.onboarding:
      mKey = 'onboarding';
      break;
    default:
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(mKey, value);
}

getOnePreference(Preference mAuxKey) async {
  String mKey = '';
  switch (mAuxKey) {
    case Preference.onboarding:
      mKey = 'onboarding';
      break;
    default:
  }

  String result = "";
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool checkValue = prefs.containsKey(mKey);
  if (checkValue) {
    result = prefs.getString(mKey) ?? '';
  }

  return result;
}

customShowToast(BuildContext context, String message) {
  int mTime = (message.length / 3).round();
  mTime = mTime < 0 ? 1 : mTime;

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: mTime,
    backgroundColor: Constants.colorRed,
    textColor: Colors.black,
    fontSize: 14.0,
  );
}
