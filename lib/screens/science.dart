import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newsCubit/news_cubit.dart';
import 'package:news/newsCubit/news_states.dart';
import 'package:news/widgets/widget.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.scienceArticle.isNotEmpty,
            builder: (context) =>
                listviewBuilder(cubit.scienceArticle, context),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        listener: (context, state) {});
  }
}
