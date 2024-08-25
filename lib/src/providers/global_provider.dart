import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  // Token
  String _mToken = "";
  String get mToken => _mToken;
  set mToken(String mToken) {
    _mToken = mToken;
    notifyListeners();
  }
}
