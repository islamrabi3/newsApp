import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newsCubit/news_cubit.dart';
import 'package:news/news_layout.dart';
import 'package:news/observer/bloc_observer.dart';
import 'package:news/shared/dio_helper.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getSportApi()
        ..getScienceData()
        ..getBusinessData(),

      // ..getBusinessData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: AppBarTheme(
            // titleTextStyle: TextStyle(color: Colors.white),
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        home: NewsLayout(),
      ),
    );
  }
}
