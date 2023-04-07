import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/data_source/remoet_data_source.dart';
import 'package:news_app/module/sports/presentation/screens/sport_screen.dart';
import 'package:news_app/shared/network/dio_helper.dart';
import '../../data/model/NewsModel.dart';
import '../../module/bussiness/presentation/screens/business_screen.dart';
import '../../module/science/presentation/screens/science_screen.dart';
import '../../shared/local/shared_prefrence.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  final _remoteDataSource = NewsRemoteDataSource();
  NewsModel? businessNewsModel;
  NewsModel? scienceNewsModel;
  NewsModel? sportsNewsModel;
  NewsModel? searchNewsModel;
  bool isSearching = false;
  int currentIndex = 0;

  final SharedPrefHelper _sharedPrefHelper = SharedPrefHelper();

  final List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportScreen(),
  ];
  bool isLightMode = true;

  static NewsCubit i(BuildContext context) => BlocProvider.of(context);

  void changeLightMode() {
    isLightMode = !isLightMode;
    _sharedPrefHelper.saveData("isLightMode", isLightMode);
    emit(ChangeLightModeState(isLightMode));
  }

  void getModeFromSharedPref(bool? isLight) {
    isLightMode = isLight ?? true;
    emit(ChangeLightModeState(isLightMode));
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState(currentIndex));
  }

  Future getNews(String category) async {
    emit(NewsLoadingState());
    _remoteDataSource.getNews(category).then((value) {
      print(value);
      switch (category) {
        case "business":
          businessNewsModel = value;
          break;
        case "science":
          scienceNewsModel = value;
          break;
        case "sports":
          sportsNewsModel = value;
      }
      emit(NewsLoadedState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(NewsFailureState());
    });
  }

  void search(String text) {
    isSearching = true;
    emit(SearchLoadingState());
    _remoteDataSource.searchNews(text).then((value) {
      searchNewsModel = value;
      isSearching = false;
      emit(SearchLoadedState());
    }).catchError((e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isSearching = false;
      emit(SearchFailureState());
    });
  }
}
