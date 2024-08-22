/*
 * *
 *  * error_model.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 03:39
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/13/2024, 21:31
 *
 */

import 'package:equatable/equatable.dart';

class ErrorModel {
  Equatable event;
  String error;

  ErrorModel({required this.event, required this.error});
}
