import 'package:first_project/shared/components/components.dart';
import 'package:first_project/shared/cubit/news_cubit/news_cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class businessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newsCubit.get(context).business;
        return buildArticleConditialBuilder(list, context);
      },
    );
  }
}
