/*
 * *
 *  * film_bloc.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:18
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 18:35
 *
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kar_movie/bloc/film/film_event.dart';
import 'package:kar_movie/bloc/film/film_state.dart';
import 'package:kar_movie/tool/helper.dart';

export 'package:kar_movie/bloc/film/film_event.dart';
export 'package:kar_movie/bloc/film/film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final Helper _helper = Helper();

  FilmBloc(FilmInitialState super.initialState) {}
}
