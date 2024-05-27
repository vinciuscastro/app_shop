import 'package:flutter/material.dart';

class Settings with ChangeNotifier{
  bool _isDark = false;

  bool get isDark{
    return _isDark;
  }

  void toggleTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }

}
