part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}
class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsFailureState extends NewsState {
  @override
  List<Object> get props => [];
}
class SearchLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class SearchLoadedState extends NewsState {
  @override
  List<Object> get props => [];
}

class SearchFailureState extends NewsState {
  @override
  List<Object> get props => [];
}

class ChangeCurrentIndexState extends NewsState {
  int currentIndex;

  ChangeCurrentIndexState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}
class ChangeLightModeState extends NewsState {
  bool isLightMode;

  ChangeLightModeState(this.isLightMode);

  @override
  List<Object> get props => [isLightMode];
}
