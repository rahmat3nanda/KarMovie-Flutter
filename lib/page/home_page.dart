/*
 * *
 *  * home_page.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 05:15
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 05:15
 *
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kar_movie/bloc/film/film_bloc.dart';
import 'package:kar_movie/common/styles.dart';
import 'package:kar_movie/model/app/error_model.dart';
import 'package:kar_movie/model/app/singleton_model.dart';
import 'package:kar_movie/model/film_data_model.dart';
import 'package:kar_movie/page/search_page.dart';
import 'package:kar_movie/tool/helper.dart';
import 'package:kar_movie/widget/empty_widget.dart';
import 'package:kar_movie/widget/film_item_widget.dart';
import 'package:kar_movie/widget/reload_data_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SingletonModel _model;
  late FilmBloc _filmBloc;
  late Helper _helper;

  late RefreshController _cRefresh;
  ErrorModel? _error;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _model = SingletonModel.withContext(context);
    _filmBloc = BlocProvider.of<FilmBloc>(context);
    _helper = Helper();
    _cRefresh = RefreshController(initialRefresh: false);
    _isLoading = false;
    _onRefresh(fromCache: true);
  }

  void _onRefresh({bool fromCache = false}) {
    _getData(fromCache: fromCache);
    _cRefresh.refreshCompleted();
  }

  void _getData({bool fromCache = false}) {
    _isLoading = true;
    _error = null;

    if (fromCache && _model.films != null) {
      _isLoading = false;
      return;
    }

    _filmBloc.add(const FilmDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilmBloc, FilmState>(
      bloc: _filmBloc,
      listener: (c, s) {
        if (s is FilmDataSuccessState) {
          _model = SingletonModel.withContext(context);
          _isLoading = false;
        } else if (s is FilmDataFailedState) {
          _isLoading = false;
          if (_model.films != null) {
            _helper.showToast("Gagal memuat data");
          } else {
            _error = ErrorModel(
              event: const FilmDataEvent(),
              error: s.data.message,
            );
          }
        }
      },
      child: BlocBuilder(
        bloc: _filmBloc,
        builder: (c, s) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("KarMovie"),
              actions: [
                IconButton(
                  onPressed: () => _helper.jumpToPage(
                    context,
                    page: const SearchPage(),
                  ),
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            body: SafeArea(
              child: SmartRefresher(
                primary: true,
                physics: const ClampingScrollPhysics(),
                enablePullDown: true,
                enablePullUp: false,
                header: WaterDropMaterialHeader(
                  backgroundColor: AppColor.primary,
                  color: Colors.black,
                ),
                footer: CustomFooter(
                  builder: (context, status) => Container(),
                ),
                controller: _cRefresh,
                onRefresh: _onRefresh,
                child: _stateView(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _stateView() {
    if (_isLoading) {
      return Center(
        child: SpinKitWaveSpinner(
          color: AppColor.primaryLight,
          trackColor: AppColor.primary,
          waveColor: AppColor.secondary,
          size: 64,
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: ReloadDataWidget(
          error: "Gagal memuat data.",
          onReload: _onRefresh,
        ),
      );
    }

    if (_model.films?.isEmpty ?? true) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: EmptyWidget()),
      );
    }

    return _mainView();
  }

  Widget _mainView() {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      itemCount: _model.films?.length ?? 0,
      separatorBuilder: (_, __) => const SizedBox(),
      itemBuilder: (_, i) {
        FilmDataModel data = _model.films![i];
        return FilmItemWidget(data: data, onTap: () {});
      },
    );
  }
}
