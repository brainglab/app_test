import 'dart:developer';

import 'package:app_test/src/custom/configurations.dart';
import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mOnBoarding = "...";

  @override
  void initState() {
    super.initState();

    getOnePreference(Preference.onboarding).then((dynamic result) {
      log("==> result: $result");
      mOnBoarding = result;
      setState(() {});

      if (result == "") {
        setOnePreference(Preference.onboarding, "true");
        log("==> mOnBoarding: $mOnBoarding");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Constants.colorBackground,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                mOnBoarding,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
              Text(
                Consfigurations.mVersion,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
