import 'package:flutter/material.dart';

class Utils {
  Utils._();
  // global key
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();
  // helper key
  static final query = MediaQuery.of(navigatorKey.currentContext!);
  static final queryWidth = query.size.width;
  static final queryHeight = query.size.height;
  static final themeOf = Theme.of(navigatorKey.currentContext!);
  static final colorScheme = themeOf.colorScheme;
  static final textTheme = themeOf.textTheme;
  // snackbar
  static void errorsSnackbar({String? message, Color? color}) {
    if (message == null) return;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        textAlign: TextAlign.center,
      ),
      backgroundColor: color,
    );
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void successSanckbar({String? message, Color? color}) {
    if (message == null) return;
    final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        backgroundColor: color);
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // customization inputfield
  static InputDecoration customInputDecoration(
      {lable = '', String hintText = 'Search/Scan', Icon? prefixIcon}) {
    return InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: colorScheme.primary,
          ),
        ),
        prefixIcon: prefixIcon,
        labelText: lable,
        hintText: hintText);
  }
}
