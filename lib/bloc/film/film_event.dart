/*
 * *
 *  * film_event.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:17
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 19:37
 *
 */

import 'package:equatable/equatable.dart';

abstract class FilmEvent extends Equatable {
  const FilmEvent();

  @override
  List<Object> get props => [];
}

class FilmDataEvent extends FilmEvent {
  const FilmDataEvent();

  @override
  String toString() {
    return 'FilmDataEvent{}';
  }
}

class FilmSearchEvent extends FilmEvent {
  final String title;

  const FilmSearchEvent(this.title);

  @override
  String toString() {
    return 'FilmSearchEvent{title: $title}';
  }
}
