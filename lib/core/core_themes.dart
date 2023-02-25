import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoreThemes {
  CoreThemes._();
  static final inputDecorationTheme = InputDecorationTheme(
    labelStyle: GoogleFonts.getFont('Roboto', fontSize: 16, fontWeight: FontWeight.w500),
    hintStyle: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w400),
  );
  static final bottomNavigationBarThemeData = BottomNavigationBarThemeData(
    selectedLabelStyle: GoogleFonts.getFont('Roboto', fontWeight: FontWeight.w600),
    unselectedLabelStyle: GoogleFonts.getFont('Roboto', fontWeight: FontWeight.w500),
  );
  static final outlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: BorderSide.none),
      textStyle: GoogleFonts.getFont('Roboto', fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );
  static final elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: GoogleFonts.getFont('Roboto', fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );
  static final textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      textStyle: GoogleFonts.getFont('Roboto', fontSize: 16, fontWeight: FontWeight.w500),
    ),
  );
  static final textTheme = TextTheme(
    displayLarge: GoogleFonts.getFont('Roboto', fontSize: 32, fontWeight: FontWeight.w600),
    displayMedium: GoogleFonts.getFont('Roboto', fontSize: 28, fontWeight: FontWeight.w600),
    displaySmall: GoogleFonts.getFont('Roboto', fontSize: 24, fontWeight: FontWeight.w600),
    headlineLarge: GoogleFonts.getFont('Roboto', fontSize: 22, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.getFont('Roboto', fontSize: 20, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.getFont('Roboto', fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge: GoogleFonts.getFont('Montserrat', fontSize: 18, fontWeight: FontWeight.w400),
    bodyMedium: GoogleFonts.getFont('Montserrat', fontSize: 16, fontWeight: FontWeight.w400),
    bodySmall: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w400),
    titleMedium: GoogleFonts.getFont('Montserrat', fontSize: 14, fontWeight: FontWeight.w400),
    titleSmall: GoogleFonts.getFont('Montserrat', fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: GoogleFonts.getFont('Roboto', fontSize: 16, fontWeight: FontWeight.w600),
    labelMedium: GoogleFonts.getFont('Roboto', fontSize: 14, fontWeight: FontWeight.w600),
    labelSmall: GoogleFonts.getFont('Roboto', fontSize: 12, fontWeight: FontWeight.w600),
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    colorSchemeSeed: const Color(0xFFCFBCFF),
    inputDecorationTheme: inputDecorationTheme,
    bottomNavigationBarTheme: bottomNavigationBarThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    textTheme: textTheme,
  );
  static final lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    colorSchemeSeed: const Color(0xFF6750A4),
    inputDecorationTheme: inputDecorationTheme,
    bottomNavigationBarTheme: bottomNavigationBarThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    textTheme: textTheme,
  );
}
