/*
 * *
 *  * empty_widget.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 06:15
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 06:15
 *
 */

import 'package:flutter/material.dart';
import 'package:kar_movie/common/constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Text(
          "Data lagi kosong 😔",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "Aduh...\nDatanya lagi gak ada, coba lain kali ya.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
