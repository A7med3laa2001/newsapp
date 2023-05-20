import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Cubit/states.dart';
import 'package:newsapp/Screens/business_screen.dart';
import 'package:newsapp/Screens/sports_screen.dart';

import '../Network/Remote/Dio_helper.dart';
import '../Screens/science_screen.dart';

 class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: "Business",),
    BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports",),
    BottomNavigationBarItem(icon: Icon(Icons.science),label: "Science",),
  ];

  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> Business = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        'v2/top-headlines',
        {
          'country':'us',
          'category':'business',
          'apiKey':'d3e41cc6b1174ce489f84a6133fdef52'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      Business = value.data['articles'];
      print(Business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> Sports = [];

  void getSports(){
    emit(NewsGetSportsLoadingState());

    DioHelper.getData(
        'v2/top-headlines',
        {
          'country':'us',
          'category':'Sports',
          'apiKey':'d3e41cc6b1174ce489f84a6133fdef52'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      Sports = value.data['articles'];
      print(Sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((sportsError){
      print(sportsError.toString());
      emit(NewsGetSportsErrorState(sportsError.toString()));
    });
  }

  List<dynamic> Science = [];

  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        'v2/top-headlines',
        {
          'country':'us',
          'category':'science',
          'apiKey':'d3e41cc6b1174ce489f84a6133fdef52'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      Science = value.data['articles'];
      print(Science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((scienceError){
      print(scienceError.toString());
      emit(NewsGetScienceErrorState(scienceError.toString()));
    });
  }


  void changeBottomNavBar(int index){
    currentIndex = index;
    if(currentIndex==1) {
      getSports();
    }
    if(currentIndex==2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}){
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppModeState());
    } else {
      isDark = !isDark;
      //CacheHelper.putData("isDark", isDark).then((value) => emit(NewsChangeAppModeState()));
    }
  }

  List<dynamic> Search = [];


  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    Search = [];
    DioHelper.getData(
        'v2/everything',
        {
          'q':value,
          'apiKey':'d3e41cc6b1174ce489f84a6133fdef52'
        }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((SearchError){
      print(SearchError.toString());
      emit(NewsGetSearchErrorState(SearchError.toString()));
    });
  }
 }