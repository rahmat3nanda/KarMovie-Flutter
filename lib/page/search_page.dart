/*
 * *
 *  * search_page.dart - KarMovie
 *  * Created by Rahmat Trinanda (rahmat3nanda@gmail.com) on 08/23/2024, 06:14
 *  * Copyright (c) 2024 . All rights reserved.
 *  * Last modified 08/23/2024, 06:14
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
import 'package:kar_movie/widget/empty_widget.dart';
import 'package:kar_movie/widget/film_item_widget.dart';
import 'package:kar_movie/widget/reload_data_widget.dart';
import 'package:kar_movie/widget/section_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FilmBloc _filmBloc;

  late RefreshController _cRefresh;
  late TextEditingController _cSearch;
  List<FilmDataModel>? _data;
  ErrorModel? _error;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    SingletonModel.withContext(context);
    _filmBloc = BlocProvider.of<FilmBloc>(context);
    _cRefresh = RefreshController(initialRefresh: false);
    _cSearch = TextEditingController();
    _isLoading = false;
  }

  void _onSearch() {
    _data = null;

    if (_cSearch.text.trim().isEmpty) {
      return;
    }

    _isLoading = true;
    _error = null;

    _filmBloc.add(FilmSearchEvent(_cSearch.text.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FilmBloc, FilmState>(
      bloc: _filmBloc,
      listener: (c, s) {
        if (s is FilmSearchSuccessState) {
          _isLoading = false;
          _data = s.data;
        } else if (s is FilmDataFailedState) {
          _isLoading = false;
          _error = ErrorModel(
            event: FilmSearchEvent(_cSearch.text.trim()),
            error: s.data.message,
          );
        }
      },
      child: BlocBuilder(
        bloc: _filmBloc,
        builder: (c, s) {
          return Scaffold(
            appBar: AppBar(
              title: TextFormField(
                maxLines: 1,
                textInputAction: TextInputAction.search,
                controller: _cSearch,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                onFieldSubmitted: (s) => _onSearch(),
                decoration: const InputDecoration(
                  hintText: "Cari film berdasarkan judul...",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
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
                onRefresh: _onSearch,
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
          onReload: _onSearch,
        ),
      );
    }

    if (_cSearch.text.trim().isEmpty) {
      return Container();
    }

    if (_data?.isEmpty ?? true) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: EmptyWidget()),
      );
    }

    return _mainView();
  }

  Widget _mainView() {
    return SectionWidget(
      title: "Hasil untuk pencarian \"${_cSearch.text.trim()}\"",
      child: ListView.separated(
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        itemCount: _data?.length ?? 0,
        separatorBuilder: (_, __) => const SizedBox(),
        itemBuilder: (_, i) {
          FilmDataModel data = _data![i];
          return FilmItemWidget(data: data, onTap: () {});
        },
      ),
    );
  }
}
