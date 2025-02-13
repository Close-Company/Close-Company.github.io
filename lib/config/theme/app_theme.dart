import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const TextTheme _mobileTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
  displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
  titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.2),
  titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.2),
  titleSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.2),
  displayMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
  labelLarge: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black),
  labelMedium: TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 14),
  labelSmall: TextStyle(fontWeight: FontWeight.w800, color: Colors.black, fontSize: 12),
  bodyLarge: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 16),
  bodyMedium: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14),
  bodySmall: TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 12),
);
const TextTheme _webTextTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
  displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
  titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.4),
  titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.4),
  titleSmall: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14, letterSpacing: 0.3, wordSpacing: 0.3, height: 1.4),
  displayMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
  labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
  labelMedium: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 14),
  labelSmall: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: 12),
  bodyLarge: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 16),
  bodyMedium: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 14),
  bodySmall: TextStyle(color: Colors.black54, fontWeight: FontWeight.w300, fontSize: 12),
);

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    textTheme: kIsWeb ? _webTextTheme : _mobileTextTheme,
    useMaterial3: true,
  );
}
