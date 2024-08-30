import 'package:app_test/src/custom/library.dart';
import 'package:flutter/material.dart';

class Constants {
  // colors
  static Color colorAccent = HexColor.fromHex("#21f07d");
  static Color colorPrimary = HexColor.fromHex("#cccccc");
  static Color colorSecundary = HexColor.fromHex("#cccccc");
  static Color colorSuccess = HexColor.fromHex("#cccccc");
  static Color colorInfo = HexColor.fromHex("#cccccc");
  static Color colorWarning = HexColor.fromHex("#cccccc");
  static Color colorDanger = HexColor.fromHex("#cccccc");
  static Color colorLight = HexColor.fromHex("#ffffff");
  static Color colorGray = HexColor.fromHex("#cccccc");
  static Color colorDark = HexColor.fromHex("#010101");

  static Color colorBackgroundSplash = HexColor.fromHex("#21f07d");
  static Color colorBackground = HexColor.fromHex("#1a1a1a");

  // text styles
  // =========================================

  // style bold
  static final TextStyle textStyleAccentBold = TextStyle(color: colorAccent, fontSize: 13, fontFamily: 'poppins', fontWeight: FontWeight.bold);
  static final TextStyle textStylePrimaryBold = TextStyle(color: colorPrimary, fontSize: 13, fontFamily: 'poppins', fontWeight: FontWeight.bold);
  static final TextStyle textStyleDarkBold = TextStyle(color: colorDark, fontSize: 13, fontFamily: 'poppins', fontWeight: FontWeight.bold);

  // style small
  static final TextStyle textStyleGraySmall = TextStyle(color: colorGray, fontSize: 11, fontFamily: 'poppins', fontWeight: FontWeight.normal);
}
