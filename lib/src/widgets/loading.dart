import 'package:flutter/material.dart';
import 'package:app_test/src/custom/constants.dart';
import 'package:app_test/src/custom/library.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.mIndicator, this.mColor, this.mSize});

  final Indicator? mIndicator;
  final Color? mColor;
  final double? mSize;

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return Container(
      alignment: Alignment.center,
      width: (mSize ?? 20),
      height: (mSize ?? 20),
      child: Center(
        child: LoadingIndicator(
          indicatorType: (mIndicator == null ? Indicator.ballBeat : mIndicator!),
          colors: [(mColor ?? Constants.colorAccent)],
        ),
      ),
    );
  }
}
