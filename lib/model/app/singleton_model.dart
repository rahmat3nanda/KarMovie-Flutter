/*
 * *
 *  * singleton_model.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:13
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:12
 *
 */

import 'package:flutter/material.dart';
import 'package:kar_movie/model/film_data_model.dart';

class SingletonModel {
  static SingletonModel? _singleton;

  factory SingletonModel() => _singleton ??= SingletonModel._internal();

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton ??= SingletonModel._internal();
    _singleton!.context = context;

    return _singleton!;
  }

  static SingletonModel get shared => _singleton ??= SingletonModel._internal();

  BuildContext? context;
  String? token;
  List<FilmDataModel>? films;

  void destroy() {
    _singleton = null;
  }
}
