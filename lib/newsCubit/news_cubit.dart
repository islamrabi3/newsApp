import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/models/sports_model.dart';
import 'package:news/newsCubit/news_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/business.dart';
import 'package:news/screens/science.dart';
import 'package:news/screens/sports.dart';
import 'package:news/shared/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialNewsState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [SportScreen(), ScienceScreen(), BusinessScreen()];

  List<String> titles = [
    'Sports News',
    'Science News',
    'Business News',
  ];

  void toggleBottomNavBar(index) {
    currentIndex = index;
    emit(ToggleBottomNavBarState());
  }

//newsapi.org/v2/top-headlines?country=eg&category=sport&apiKey=123c8c6764f14a23939aeae7a3100935

  List sportArticle = [];
  void getSportApi() {
    emit(LoadingSportState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': '123c8c6764f14a23939aeae7a3100935',
    }).then((value) {
      // sportModel = SportModel.fromJson(value.data);
      // print(sportModel!.articleData![4]['title']);
      sportArticle = value.data['articles'];
      emit(SuccessSportState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSportState());
    });
  }

//newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=123c8c6764f14a23939aeae7a3100935

  List scienceArticle = [];
  void getScienceData() {
    emit(LoadingScienceState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '123c8c6764f14a23939aeae7a3100935',
    }).then((value) {
      scienceArticle = value.data['articles'];
      print(scienceArticle[0]['title']);
      emit(SuccessScienceState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorScienceState());
    });
  }

  List businessArticle = [];
  void getBusinessData() {
    emit(LoadingBusinesssState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '123c8c6764f14a23939aeae7a3100935',
    }).then((value) {
      businessArticle = value.data['articles'];

      print(businessArticle[0]['title']);
      emit(SuccessBusinesssState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorBusinesssState());
    });
  }

  //newsapi.org/v2/everything?q=tesla&apiKey=123c8c6764f14a23939aeae7a3100935

  List searchList = [];

  void getSearchData(value) {
    emit(ErrorSearchState());
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '123c8c6764f14a23939aeae7a3100935',
    }).then((value) {
      searchList = value.data['articles'];
      print(searchList[0]['title']);
      emit(SuccessSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorSearchState());
    });
  }
}
