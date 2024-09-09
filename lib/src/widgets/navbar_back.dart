import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

enum Tinte { dark, light }

class NavbarBack extends StatelessWidget implements PreferredSizeWidget {
  const NavbarBack({super.key, this.title, this.backgroundColor, this.backgroundButtonColor, this.tinte, this.showBack = false, this.showMenu = false, this.goBack, this.mListActions, this.menu}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  final String? title;
  final Color? backgroundColor;
  final Color? backgroundButtonColor;
  final Tinte? tinte;
  final bool? showBack;
  final bool? showMenu;
  final Function? goBack;
  final List<Widget>? mListActions;
  final Widget? menu;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: (tinte == Tinte.light ? Constants.colorBackgroundLayout : Constants.colorBackgroundSplash),

          // Status bar brightness (optional)
          statusBarIconBrightness: (tinte == Tinte.light ? Brightness.dark : Brightness.light), // For Android (dark icons)
          statusBarBrightness: (tinte == Tinte.light ? Brightness.light : Brightness.dark), // For iOS (dark icons)
        ),
        surfaceTintColor: (backgroundColor ?? Constants.colorBackgroundLayout),
        backgroundColor: (backgroundColor ?? Constants.colorBackgroundLayout),
        iconTheme: const IconThemeData(),
        centerTitle: true,
        title: Container(
          color: (backgroundColor ?? Constants.colorBackgroundLayout),
          child: Text(
            (title == null ? "" : title!),
            style: (tinte == Tinte.dark ? Constants.textStyleBlackTitle : Constants.textStyleWhiteTitle),
            textAlign: TextAlign.center,
          ),
        ),
        elevation: 0,
        leading: (showBack == true
            ? Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(right: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constants.radius),
                  color: (tinte == Tinte.light ? Constants.colorWhite : Constants.colorBlack),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CustomButton(
                  color: Colors.transparent,
                  child: Icon(
                    TablerIcons.chevron_left,
                    color: (tinte == Tinte.light ? Constants.colorBlack : Constants.colorWhite),
                    size: 30,
                  ),
                  callback: () {
                    Navigator.of(context).pop();
                    // if the navigator received a callback function, call it
                    if (goBack != null) {
                      goBack!();
                    }
                  },
                ),
              )
            : (showMenu == true
                ? CustomButton(
                    color: Constants.colorBackgroundLayout,
                    borderRadius: 500,
                    child: Icon(
                      TablerIcons.heart,
                      color: (tinte == Tinte.light ? Constants.colorBlack : Constants.colorWhite),
                      size: 22,
                    ),
                    callback: () => Scaffold.of(context).openDrawer(),
                  )
                : null)),
        actions: mListActions
        // actions: [
        //   ((returnHome != null)
        //       ? IconButton(
        //           icon: Icon(
        //             FontAwesomeIcons.home,
        //             color: Constants.colorBlack,
        //           ),
        //           onPressed: () {
        //             globalContext = context;
        //             navigate(context, CustomPage.main); // receive the page
        //           },
        //         )
        //       : Container())
        // ]

        );
  }
}
