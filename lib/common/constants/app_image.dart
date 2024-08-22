/*
 * *
 *  * app_image.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:05
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 18:04
 *
 */

const _path = "asset/images/";

class AppImage {
  static String momovie = "kar_movie.png".withImagePath();
  static String momovieFill = "kar_movie_fill.png".withImagePath();
}

extension AppImageString on String {
  String withImagePath({bool withPrefix = true}) {
    return "$_path${withPrefix ? "img_" : ""}$this";
  }
}
