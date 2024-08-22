/*
 * *
 *  * film_model.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:25
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:25
 *  
 */

import 'package:kar_movie/model/film_data_model.dart';

class FilmModel {
  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<FilmDataModel>? data;

  FilmModel({
    this.count,
    this.next,
    this.previous,
    this.data,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        data: json["results"] == null
            ? []
            : List<FilmDataModel>.from(
                json["results"]!.map((x) => FilmDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
