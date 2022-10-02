import 'package:first_project/modules/business_news/business_screen.dart';
import 'package:first_project/modules/science_news/science_screen.dart';
import 'package:first_project/modules/sports_news/sports_screen.dart';
import 'package:first_project/network/remote/dio_helper.dart';
import 'package:first_project/shared/cubit/news_cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newsCubit extends Cubit<newsStates> {
  newsCubit() : super(newsInitialStates());
  int currentIndex = 0;

  static newsCubit get(context) => BlocProvider.of(context);

  // Lists of items in button nav...
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  // Lists of screens
  List<Widget> screenWidget = [
    businessScreen(),
    sportsScreen(),
    scienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(newsBottomNevStates());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void getBusiness() {
    emit(newsBusinessLoadingState());
    dioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '252c02917d2545ff83b74442c345d001',
      },
    ).then((value) {
      business = value.data["articles"];
      print(business[0]['title']);
      emit(newsBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(newsBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    if (sports.isEmpty) {
      emit(newsSportsLoadingState());
      dioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '252c02917d2545ff83b74442c345d001',
        },
      ).then((value) {
        sports = value.data["articles"];
        print(sports[0]['title']);
        emit(newsSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsSportsErrorState(error.toString()));
      });
    } else {
      emit(newsSportsSuccessState());
    }
  }

  void getScience() {
    if (science.length == 0) {
      emit(newsScienceLoadingState());
      dioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '252c02917d2545ff83b74442c345d001',
        },
      ).then((value) {
        science = value.data["articles"];
        print(science[0]['title']);
        emit(newsScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(newsScienceErrorState(error.toString()));
      });
    } else {
      emit(newsScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(newsSearchLoadingState());
    search = [];
    dioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '252c02917d2545ff83b74442c345d001',
      },
    ).then((value) {
      search = value.data["articles"];
      print(search[0]['title']);
      emit(newsSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(newsSearchErrorState(error.toString()));
    });
  }
}
