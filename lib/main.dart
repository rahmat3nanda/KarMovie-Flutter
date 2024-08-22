import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kar_movie/app.dart';
import 'package:kar_movie/bloc/observer.dart';
import 'package:kar_movie/common/configs.dart';
import 'package:kar_movie/common/constants.dart';
import 'package:kar_movie/model/app/app_version_model.dart';
import 'package:kar_movie/model/app/scheme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (errorDetails) {
    AppLog.print(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLog.print(error);
    return true;
  };
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  AppLog.debugMode = false;
  AppConfig.shared.initialize(
    scheme: AppScheme.prod,
    baseUrlApi: "https://swapi.dev/api/",
    version: AppVersionModel.empty(),
  );
  Bloc.observer = Observer();
  runApp(const App());
}
