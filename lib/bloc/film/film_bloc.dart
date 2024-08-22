/*
 * *
 *  * film_bloc.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:18
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 18:35
 *
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kar_movie/bloc/film/film_event.dart';
import 'package:kar_movie/bloc/film/film_state.dart';
import 'package:kar_movie/common/constants.dart';
import 'package:kar_movie/data/request.dart';
import 'package:kar_movie/model/app/singleton_model.dart';
import 'package:kar_movie/model/film_data_model.dart';
import 'package:kar_movie/tool/helper.dart';

export 'package:kar_movie/bloc/film/film_event.dart';
export 'package:kar_movie/bloc/film/film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final Helper _helper = Helper();

  FilmBloc(FilmInitialState super.initialState) {
    on<FilmDataEvent>(_data);
    on<FilmSearchEvent>(_search);
  }

  void _data(FilmDataEvent event, Emitter<FilmState> state) async {
    state(FilmInitialState());
    try {
      Response res = await Request().film.data();

      List<FilmDataModel> data = List<FilmDataModel>.from(
          res.data["results"].map((x) => FilmDataModel.fromJson(x)));
      SingletonModel.shared.films = data;
      AppLog.print(jsonEncode(data));
      state(const FilmDataSuccessState());
    } catch (e) {
      state(
        FilmDataFailedState(_helper.dioErrorHandler(e)),
      );
    }
  }

  void _search(FilmSearchEvent event, Emitter<FilmState> state) async {
    state(FilmInitialState());
    try {
      Response res = await Request().film.data(title: event.title);

      List<FilmDataModel> data = List<FilmDataModel>.from(
          res.data["results"].map((x) => FilmDataModel.fromJson(x)));
      AppLog.print(jsonEncode(data));
      state(FilmSearchSuccessState(data));
    } catch (e) {
      state(
        FilmSearchFailedState(_helper.dioErrorHandler(e)),
      );
    }
  }
}
