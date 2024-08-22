/*
 * *
 *  * app_locale.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:05
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:05
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocale {
  static AppLocale? _config;

  factory AppLocale() => _config ??= AppLocale._internal();

  AppLocale._internal();

  static AppLocale get shared => _config ??= AppLocale._internal();

  List<LocalizationsDelegate> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  List<Locale> supports = [
    const Locale('en'),
    const Locale('id'),
  ];
}
