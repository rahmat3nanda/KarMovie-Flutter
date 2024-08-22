/*
 * *
 *  * film_state.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:17
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 19:35
 *
 */

import 'package:equatable/equatable.dart';
import 'package:kar_movie/model/film_data_model.dart';
import 'package:kar_movie/model/response_model.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];
}

class FilmInitialState extends FilmState {}

class FilmDataSuccessState extends FilmState {
  const FilmDataSuccessState();
}

class FilmDataFailedState extends FilmState {
  final ResponseModel data;

  const FilmDataFailedState(this.data);
}

class FilmSearchSuccessState extends FilmState {
  final List<FilmDataModel> data;

  const FilmSearchSuccessState(this.data);
}

class FilmSearchFailedState extends FilmState {
  final ResponseModel data;

  const FilmSearchFailedState(this.data);
}
