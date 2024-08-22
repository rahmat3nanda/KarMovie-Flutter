/*
 * *
 *  * film_item_widget.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 06:16
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 06:16
 *
 */

import 'package:flutter/material.dart';
import 'package:kar_movie/common/constants.dart';
import 'package:kar_movie/common/styles.dart';
import 'package:kar_movie/model/film_data_model.dart';
import 'package:intl/intl.dart';
import 'package:kar_movie/tool/helper.dart';

class FilmItemWidget extends StatelessWidget {
  final FilmDataModel data;
  final Function() onTap;

  const FilmItemWidget({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLight,
      child: InkWell(
        splashColor: AppColor.secondary,
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(AppImage.karMovieFill),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Director: ${data.director ?? "-"}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Producer: ${data.producer ?? "-"}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Release Date: ${DateFormat("dd MMMM yyyy").tryFormat(data.releaseDate) ?? "-"}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
