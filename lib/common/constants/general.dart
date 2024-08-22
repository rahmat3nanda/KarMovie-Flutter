/*
 * *
 *  * general.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:06
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 18:04
 *
 */

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kar_movie/common/constants/app_string.dart';

class AppLog {
  static bool debugMode = false;
  static String tag = "[${AppString.appName.split(" ").first}]";

  static void print(dynamic data, {bool debug = false}) {
    String message = "[${DateTime.now().toUtc()}]$tag$data";
    if (debugMode || debug) {
      debugPrint(message);
    } else {
      log(message);
    }
  }
}
