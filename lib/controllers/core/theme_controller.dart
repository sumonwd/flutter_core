import 'package:flutter/material.dart';
import '../../core/apis.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get getThemeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await Apis.initShPrefs;
    await prefs.setString('themeMode', mode.name);
    _themeMode = mode;
    notifyListeners();
  }

  Future<void> setAutoThemeMode() async {
    late ThemeMode localMode;
    final prefs = await Apis.initShPrefs;
    if (!prefs.containsKey('themeMode')) {
      localMode = ThemeMode.dark;
    }
    final themeData = prefs.getString('themeMode');
    switch (themeData) {
      case 'system':
        localMode = ThemeMode.system;
        break;
      case 'dark':
        localMode = ThemeMode.dark;
        break;
      case 'light':
        localMode = ThemeMode.light;
        break;
      default:
        localMode = ThemeMode.system;
    }
    _themeMode = localMode;
    notifyListeners();
  }
}
