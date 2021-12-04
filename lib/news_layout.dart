import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newsCubit/news_cubit.dart';
import 'package:news/newsCubit/news_states.dart';
import 'package:news/screens/search_screen.dart';
import 'package:news/widgets/widget.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.light),
                  ),
                  IconButton(
                    onPressed: () {
                      naviagteTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              )
            ],
            titleSpacing: 0.0,
            leading: Icon(Icons.bolt_outlined),
            title: Text(NewsCubit.get(context)
                .titles[NewsCubit.get(context).currentIndex]),
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index) {
              NewsCubit.get(context).toggleBottomNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports), label: 'Sports'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science), label: 'science'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business), label: 'business'),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
