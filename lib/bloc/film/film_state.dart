/*
 * *
 *  * film_state.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:17
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 19:35
 *
 */

import 'package:equatable/equatable.dart';

abstract class FilmState extends Equatable {
  const FilmState();

  @override
  List<Object> get props => [];
}

class FilmInitialState extends FilmState {}
