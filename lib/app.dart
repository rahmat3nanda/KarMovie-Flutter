/*
 * *
 *  * app.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:16
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:16
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kar_movie/bloc/film/film_bloc.dart';
import 'package:kar_movie/common/configs.dart';
import 'package:kar_movie/common/constants.dart';
import 'package:kar_movie/common/styles.dart';
import 'package:kar_movie/model/app/app_version_model.dart';
import 'package:kar_movie/model/app/scheme_model.dart';
import 'package:kar_movie/page/splash_page.dart';
import 'package:package_info_plus/package_info_plus.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  void _getInfo() {
    PackageInfo.fromPlatform().then((i) {
      setState(() {
        AppConfig.shared.version = AppVersionModel(
          name: i.version,
          number: int.tryParse(i.buildNumber) ?? 1,
        );
      });
    }).catchError((e) {
      _getInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilmBloc>(
          create: (BuildContext context) => FilmBloc(FilmInitialState()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Stack(
          children: [
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: MaterialApp(
                localizationsDelegates: AppLocale.shared.delegates,
                supportedLocales: AppLocale.shared.supports,
                debugShowCheckedModeBanner: false,
                title: AppString.appName,
                theme: AppTheme.main(context),
                home: const SplashPage(),
              ),
            ),
            if (AppConfig.shared.scheme == AppScheme.dev)
              IgnorePointer(
                ignoring: true,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Opacity(
                    opacity: .3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: double.infinity),
                        Text(
                          "DEV\n${AppConfig.shared.version.toString()}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
