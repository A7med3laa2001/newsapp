abstract class NewsStates {}

class NewsInitialState extends NewsStates{}

class NewsBottomNavState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String Error;

  NewsGetBusinessErrorState(this.Error);
}

class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}

class NewsGetSportsErrorState extends NewsStates{
  final String Error;

  NewsGetSportsErrorState(this.Error);
}

class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}

class NewsGetScienceErrorState extends NewsStates{
  final String Error;

  NewsGetScienceErrorState(this.Error);
}

class NewsGetScienceLoadingState extends NewsStates{}

class NewsChangeAppModeState extends NewsStates{}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String Error;

  NewsGetSearchErrorState(this.Error);
}

class NewsGetSearchLoadingState extends NewsStates{}
