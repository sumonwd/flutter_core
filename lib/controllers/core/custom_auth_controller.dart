import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/core/user_model.dart';
import '../../core/apis.dart';

class CustomAuthController extends ChangeNotifier {
  // state
  String? _token;
  DateTime? _expiresIn;
  UserModel? _user;
  Timer? _sessionTimer;
  bool _isLoading = false;

  // getters
  String? get token => _token;
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _token != null;

  // actions
  Future<void> login(Map<String, dynamic> userInfo) async {
    _isLoading = true;
    try {
      final res = await http.post(Uri.parse(Apis.login),
          body: jsonEncode(userInfo), headers: _setHeaders());
      if (res.statusCode == 200) {
        final resData = jsonDecode(res.body);
        _token = resData['token'];
        _user = UserModel.fromJson(resData['user']);
        _expiresIn = DateTime.parse(resData['expiresIn']);
        _autoLogout();
        notifyListeners();
        final prefs = await Apis.initShPrefs;
        final userData = jsonEncode({
          "token": token,
          "expiresIn": _expiresIn?.toIso8601String(),
          "user": user?.toJson(),
        });
        prefs.setString("userInfo", userData);
      } else {
        throw res.body;
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
    }
  }

  Future<bool> tryAutoLogin() async {
    _isLoading = true;
    final prefs = await Apis.initShPrefs;
    if (!prefs.containsKey('userInfo')) {
      _isLoading = false;
      return false;
    }
    final decodeUserData = jsonDecode(prefs.getString('userInfo')!);

    final expiryDate = DateTime.parse(decodeUserData['expiresIn']);
    if (expiryDate.isBefore(DateTime.now())) {
      _isLoading = false;
      return false;
    }
    _token = decodeUserData['token'];
    _expiresIn = expiryDate;

    _user = UserModel.fromJson(decodeUserData['user']);
    notifyListeners();
    _autoLogout();
    _isLoading = false;
    return true;
  }

// auto logout
  void _autoLogout() {
    final timeToExpiry = _expiresIn!.difference(DateTime.now()).inMinutes;
    _sessionTimer = Timer(Duration(minutes: timeToExpiry), logout);
  }

// Logout
  Future<void> logout() async {
    _isLoading = true;
    _token = null;
    _expiresIn = null;
    _user = null;
    if (_sessionTimer != null) {
      _sessionTimer!.cancel();
    }
    final prefs = await Apis.initShPrefs;
    if (prefs.containsKey('userInfo')) {
      prefs.remove('userInfo');
    }
    _isLoading = false;
    notifyListeners();
  }

  _setHeaders() => {'Content-type': 'application/json', 'Accept': 'application/json'};
}
