/*
 * *
 *  * app_icon.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:05
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 18:04
 *
 */

const _path = "asset/icons/";

class AppIcon {
  static String karMovie = "kar_movie.svg".withIconPath();
}

extension AppIconString on String {
  String withIconPath({bool withPrefix = true, String group = ""}) {
    return "$_path$group${group.isEmpty ? "" : "/"}${withPrefix ? "ic_${group.isEmpty ? "" : "${group}_"}" : ""}$this";
  }
}
