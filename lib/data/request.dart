/*
 * *
 *  * request.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:28
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:28
 *
 */

import 'package:dio/dio.dart' as dio;
import 'package:kar_movie/data/repo.dart';

late Repo _repo;

class Request {
  late RequestFilm film;

  Request() {
    _repo = Repo();
    film = RequestFilm();
  }
}

class RequestFilm {
  Future<dio.Response> data({String? title}) {
    return _repo.film.data(param: {
      if (title != null) "search": title,
    });
  }
}
