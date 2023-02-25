import 'package:shared_preferences/shared_preferences.dart';

class Apis {
  Apis._();
  // apis routes

  // static const apiBaseUrl = 'http://10.0.2.2:8000/api/v1';  // android em
  static const apiBaseUrl = 'http://127.0.0.1:8000/api/v1';
  static const login = '$apiBaseUrl/login';

  // SharedPreferences init
  static Future<SharedPreferences> get initShPrefs async => await SharedPreferences.getInstance();
}
