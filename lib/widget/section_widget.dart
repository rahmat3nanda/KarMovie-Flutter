/*
 * *
 *  * section_widget.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:43
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 07/14/2024, 04:52
 *
 */

import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const SectionWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        child
      ],
    );
  }
}
