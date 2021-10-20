import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CustomAppTheme {
  BuildContext context;
  CustomAppTheme({required this.context});

  static const Color contrastLight = Color(0xFFF3F3F3);
  static const Color contrastDark = Color(0xFF121212);

  static const Color secondaryLight = Color(0xFFEE5B27);
  static const Color secondaryDark = Color(0xFFEE5B27);

  static const double defaultRadius = 2;
  static const Radius defaultBorderRadius = Radius.circular(defaultRadius);

  static const double defaultSpacing = 10;

  static const Size btnMinimumSize = Size(88, 36);

  static int getDefaultAlpha(bool isDarkmode) => isDarkmode ? 150 : 20;
  static int getDisabledAlpha(bool isDarkmode) => isDarkmode ? 120 : 80;

  AppBarTheme getAppBarTheme(bool isDarkMode) {
    var copyWith = Theme.of(context).appBarTheme.copyWith;
    return copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        backgroundColor: isDarkMode ? contrastDark : contrastLight,
        foregroundColor: isDarkMode ? contrastLight : contrastDark,
        centerTitle: true,
        elevation: 0,
        shape: Border(
          bottom: BorderSide(
            color: (isDarkMode ? contrastLight : contrastDark).withAlpha(getDefaultAlpha(isDarkMode)),
            width: 0.5,
          ),
        ));
  }

  ColorScheme getColorScheme(bool isDarkMode) {
    var copyWith = Theme.of(context).colorScheme.copyWith;
    return copyWith(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      background: isDarkMode ? contrastDark : contrastLight,
      primary: isDarkMode ? contrastLight : contrastDark,
      secondary: isDarkMode ? secondaryDark : secondaryLight,
    );
  }

  TextStyle getAppBarTextStyle(bool isDarkMode) {
    double screenWidth = window.physicalSize.width;
    return TextStyle(
      fontSize: screenWidth < 500 ? 14 : 16,
      fontWeight: FontWeight.w700,
      color: isDarkMode ? contrastLight : contrastDark,
    );
  }

  TextTheme getTextTheme(bool isDarkMode) {
    double screenWidth = window.physicalSize.width;
    return TextTheme(
      headline1: TextStyle(
        fontSize: screenWidth < 500 ? 22 : 26,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
      headline2: TextStyle(
        fontSize: screenWidth < 500 ? 20 : 22,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
      headline3: TextStyle(
        fontSize: screenWidth < 500 ? 18 : 20,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
      headline4: TextStyle(
        fontSize: screenWidth < 500 ? 14 : 16,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
      headline5: TextStyle(
        fontSize: screenWidth < 500 ? 12 : 14,
        fontWeight: FontWeight.w700,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
      headline6: getAppBarTextStyle(isDarkMode),
      bodyText1: TextStyle(
        fontSize: screenWidth < 500 ? 12 : 14,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? contrastLight : contrastDark,
        letterSpacing: 0.3,
      ),
      subtitle1: TextStyle(
        fontSize: screenWidth < 500 ? 12 : 14,
        fontWeight: FontWeight.w400,
        color: isDarkMode ? contrastLight : contrastDark,
      ),
    );
  }

  ThemeData getThemeData(bool isDarkMode) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkMode ? contrastDark : contrastLight,
      appBarTheme: getAppBarTheme(isDarkMode),
      colorScheme: getColorScheme(isDarkMode),
      textTheme: getTextTheme(isDarkMode),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: btnMinimumSize,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(defaultBorderRadius),
          ),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return (isDarkMode ? contrastLight : contrastDark).withAlpha(getDisabledAlpha(isDarkMode));
            }
            return isDarkMode ? contrastDark : contrastLight;
          }),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return (isDarkMode ? contrastLight : contrastDark).withAlpha(getDefaultAlpha(isDarkMode));
            }
            return isDarkMode ? contrastLight : contrastDark;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          minimumSize: btnMinimumSize,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(defaultBorderRadius),
          ),
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(
                color: (isDarkMode ? contrastLight : contrastDark).withAlpha(getDefaultAlpha(isDarkMode)),
              );
            }
            return BorderSide(
              color: isDarkMode ? contrastLight : contrastDark,
            );
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return (isDarkMode ? contrastLight : contrastDark).withAlpha(getDisabledAlpha(isDarkMode));
            }
            return isDarkMode ? contrastLight : contrastDark;
          }),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          minimumSize: btnMinimumSize,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(defaultBorderRadius),
          ),
        ).copyWith(
          foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return (isDarkMode ? contrastLight : contrastDark).withAlpha(getDisabledAlpha(isDarkMode));
            }
            return isDarkMode ? contrastLight : contrastDark;
          }),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        filled: true,
        fillColor: (isDarkMode ? contrastLight : contrastDark).withAlpha(getDefaultAlpha(isDarkMode)),
        hintStyle: getTextTheme(isDarkMode).bodyText1!.copyWith(
              color: (isDarkMode ? contrastLight : contrastDark).withAlpha(getDisabledAlpha(isDarkMode)),
            ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: isDarkMode ? secondaryLight : secondaryDark,
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    );
  }

  static bool isDarkMode() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    return brightness == Brightness.dark;
  }

  static ButtonStyle getSecondaryElevatedStyle() {
    return ElevatedButton.styleFrom(
      onPrimary: contrastLight,
      primary: isDarkMode() ? secondaryLight : secondaryDark,
    );
  }

  static ButtonStyle getSecondaryTextStyle() {
    return TextButton.styleFrom(
      primary: isDarkMode() ? secondaryLight : secondaryDark,
    );
  }

  static ButtonStyle getSecondaryOutlinedStyle() {
    return ElevatedButton.styleFrom(
      side: BorderSide(
        color: isDarkMode() ? secondaryLight : secondaryDark,
      ),
    ).copyWith(
      foregroundColor: MaterialStateProperty.all<Color>(
        isDarkMode() ? secondaryLight : secondaryDark,
      ),
    );
  }
}
