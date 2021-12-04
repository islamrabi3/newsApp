import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/newsCubit/news_cubit.dart';
import 'package:news/newsCubit/news_states.dart';
import 'package:news/widgets/widget.dart';

class SearchScreen extends StatelessWidget {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var cubit = NewsCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      cubit.getSearchData(value);
                      print(value);
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'What are you looking for ? ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  ),
                  Expanded(child: listviewBuilder(cubit.searchList, context))
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}

// BlocConsumer<NewsCubit, NewsStates>(
//         builder: (context, state) {
//           var cubit = NewsCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(),
//             body: Column(
//               children: [
//                 TextFormField(
//                   controller: searchController,
//                   onChanged: (value) {},
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                   ),
//                 ),
//                 listviewBuilder(cubit.searchList, context)
//               ],
//             ),
//           );
//         },
//         listener: (context, state) {});
