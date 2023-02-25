import 'package:shared_preferences/shared_preferences.dart';

class Apis {
  Apis._();
  // SharedPreferences init
  static Future<SharedPreferences> get initShPrefs async => await SharedPreferences.getInstance();
}
