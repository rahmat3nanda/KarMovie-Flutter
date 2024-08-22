/*
 * *
 *  * app_config.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:04
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 22:47
 *
 */

import 'package:kar_movie/model/app/app_version_model.dart';
import 'package:kar_movie/model/app/scheme_model.dart';

class AppConfig {
  static AppConfig? _config;

  factory AppConfig() => _config ??= AppConfig._internal();

  AppConfig._internal();

  static AppConfig get shared => _config ??= AppConfig._internal();

  late AppScheme scheme;
  late String baseUrlApi;
  late AppVersionModel version;

  void initialize({
    required AppScheme scheme,
    required String baseUrlApi,
    required AppVersionModel version,
  }) {
    this.scheme = scheme;
    this.baseUrlApi = baseUrlApi;
    this.version = version;
  }
}
