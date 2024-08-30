import 'dart:developer';

import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';
import 'package:app_test/src/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mOnBoarding = "...";
  Countries mContries = Countries();

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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(FocusNode());
      getCountries();
    });
  }

  getCountries() async {
    // Get a reference your Supabase client
    final mSupabase = Supabase.instance.client;
    final mResult = await mSupabase.from('countries').select();
    log("==> mResult: $mResult");

    mContries = Countries.fromJsonList(mResult);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: RefreshIndicator(
          backgroundColor: Constants.colorAccent,
          color: Constants.colorLight,
          strokeWidth: 3,
          displacement: 80,
          onRefresh: () async {
            if (mounted) {
              globalContext = context;
              getCountries();
            }
          },
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      "Paises",
                      style: Constants.textStyleDarkBold,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: mContries.items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            child: InkWell(
                              onTap: () => {},
                              borderRadius: BorderRadius.circular(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Container(
                                      width: 40,
                                      height: double.infinity,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        TablerIcons.map_pin,
                                        color: Constants.colorDark,
                                        size: 25,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 70,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mContries.items[index].mCountryName!,
                                            style: Constants.textStyleDarkBold,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            "Código ${mContries.items[index].mCountryCode}",
                                            style: Constants.textStyleGraySmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 70,
                                    child: Container(
                                      width: 40,
                                      height: double.infinity,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        TablerIcons.chevron_right,
                                        color: Constants.colorDark,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
