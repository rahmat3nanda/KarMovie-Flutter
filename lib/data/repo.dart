/*
 * *
 *  * repo.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:28
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:28
 *
 */

import 'package:dio/dio.dart' as dio;
import 'package:kar_movie/data/API.dart';
import 'package:kar_movie/data/dio.dart';

late API _api;
late Dio _dio;

class Repo {
  late RepoFilm film;

  Repo() {
    _api = API();
    _dio = Dio();
    film = RepoFilm();
  }
}

class RepoFilm {
  Future<dio.Response> data() async {
    return await _dio.get(url: _api.film.data);
  }
}
