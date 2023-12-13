import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  primaryColor: Colors.yellow,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerTheme: const DividerThemeData(color: Colors.white24),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    surfaceTintColor: Colors.transparent,
    backgroundColor: Color.fromARGB(255, 30, 30, 30),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w700,
    ),
  ),
  textTheme: TextTheme(
    bodyMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    labelSmall: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.yellow,
  ),
  useMaterial3: true,
);
