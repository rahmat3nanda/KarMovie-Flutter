/*
 * *
 *  * app_version_model.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 03:39
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 01/12/2024, 20:53
 *
 */

class AppVersionModel {
  late String name;
  late int number;

  AppVersionModel({required this.name, required this.number});

  factory AppVersionModel.empty() => AppVersionModel(name: "1.0.0", number: 1);

  @override
  String toString() => "$name($number)";
}
