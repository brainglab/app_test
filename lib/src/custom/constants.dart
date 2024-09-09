import 'package:app_test/src/custom/library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // dimensions
  static const double padding = 20;
  static const double radius = 50;
  static const double avatarRadius = 50;

  // colors
  static Color colorAccent = HexColor.fromHex('#02dfbb');
  static Color colorPrimary = HexColor.fromHex('#9E3CE8');
  static Color colorRed = HexColor.fromHex('#E83A30');
  static Color colorWhite = HexColor.fromHex('#FFFFFF');
  static Color colorBlack = HexColor.fromHex('#000000');
  static Color colorGray = HexColor.fromHex('#A4ABBE');
  static Color colorLight = HexColor.fromHex('#80FFFFFF');
  static Color colorDark = HexColor.fromHex('#010101');
  static Color colorOpacity = HexColor.fromHex('#010101').withOpacity(0.3);

  // colors layout
  static Color colorBackgroundSplash = HexColor.fromHex('#1E1E1E');
  static Color colorBackgroundLayout = HexColor.fromHex('#1E1E1E');
  static Color colorBackgroundLoading = HexColor.fromHex('#d3d3e6');
  static Color colorBackgroundPanel = HexColor.fromHex('#1E1E1E');

  // text styles
  // =========================================

  // fontsize
  static double fontSizeMega = 40;
  static double fontSizeJumbo = 20;
  static double fontSizeTitle = 18;
  static double fontSizeNormal = 15;
  static double fontSizeSmall = 11;

  static double letterSpacing = -2;

  // text style mega
  static TextStyle textStylePrimaryMega = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleAccentMega = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleRedMega = GoogleFonts.sora(color: colorRed, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleWhiteMega = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleBlackMega = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleGrayMega = GoogleFonts.sora(color: colorGray, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);
  static TextStyle textStyleLightMega = GoogleFonts.sora(color: colorLight, fontSize: fontSizeMega, letterSpacing: letterSpacing, fontWeight: FontWeight.w600);

  // text style jumbo
  static TextStyle textStylePrimaryJumbo = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleAccentJumbo = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleRedJumbo = GoogleFonts.sora(color: colorRed, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleWhiteJumbo = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleBlackJumbo = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleGrayJumbo = GoogleFonts.sora(color: colorGray, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);
  static TextStyle textStyleLightJumbo = GoogleFonts.sora(color: colorLight, fontSize: fontSizeJumbo, fontWeight: FontWeight.w600);

  // text style title
  static TextStyle textStylePrimaryTitle = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleAccentTitle = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleRedTitle = GoogleFonts.sora(color: colorRed, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleWhiteTitle = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleBlackTitle = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleGrayTitle = GoogleFonts.sora(color: colorGray, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);
  static TextStyle textStyleLightTitle = GoogleFonts.sora(color: colorLight, fontSize: fontSizeTitle, fontWeight: FontWeight.w600);

  // text style normal
  static TextStyle textStylePrimary = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleAccent = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleRed = GoogleFonts.sora(color: colorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleWhite = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleBlack = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleGray = GoogleFonts.sora(color: colorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);
  static TextStyle textStyleLight = GoogleFonts.sora(color: colorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w400);

  // text style small
  static TextStyle textStylePrimarySmall = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleAccentSmall = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleRedSmall = GoogleFonts.sora(color: colorRed, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleWhiteSmall = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleBlackSmall = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleGraySmall = GoogleFonts.sora(color: colorGray, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);
  static TextStyle textStyleLightSmall = GoogleFonts.sora(color: colorLight, fontSize: fontSizeSmall, fontWeight: FontWeight.normal);

  // text style bold
  static TextStyle textStylePrimaryBold = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleAccentBold = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleRedBold = GoogleFonts.sora(color: colorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleWhiteBold = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleBlackBold = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleGrayBold = GoogleFonts.sora(color: colorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);
  static TextStyle textStyleLightBold = GoogleFonts.sora(color: colorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w600);

  // text style semi bold
  static TextStyle textStylePrimarySemiBold = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleAccentSemiBold = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleRedSemiBold = GoogleFonts.sora(color: colorRed, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleWhiteSemiBold = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleBlackSemiBold = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleGraySemiBold = GoogleFonts.sora(color: colorGray, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);
  static TextStyle textStyleLightSemiBold = GoogleFonts.sora(color: colorLight, fontSize: fontSizeNormal, fontWeight: FontWeight.w500);

  // text style bold
  static TextStyle textStylePrimaryBoldSmall = GoogleFonts.sora(color: colorPrimary, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleAccentBoldSmall = GoogleFonts.sora(color: colorAccent, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleRedBoldSmall = GoogleFonts.sora(color: colorRed, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleWhiteBoldSmall = GoogleFonts.sora(color: colorWhite, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleBlackBoldSmall = GoogleFonts.sora(color: colorBlack, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleGrayBoldSmall = GoogleFonts.sora(color: colorGray, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
  static TextStyle textStyleLightBoldSmall = GoogleFonts.sora(color: colorLight, fontSize: fontSizeSmall, fontWeight: FontWeight.w600);
}
