import 'package:first_project/shared/cubit/news_cubit/news_cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';

class searchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormField(
                  testLabel: 'Search',
                  prefix: Icons.search_outlined,
                  control: searchController,
                  type: TextInputType.text,
                  typingStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  iconColor: Theme.of(context).primaryColor,
                  validate: (String? value) {
                    if (value == '') {
                      return 'You must enter anything';
                    }
                    return null;
                  },
                  onChange: (value) {
                    newsCubit.get(context).getSearch(value);
                  },
                ),
                Expanded(
                  child: buildArticleConditialBuilder(list, context,
                      isSearch: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
