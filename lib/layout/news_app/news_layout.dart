import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_app/search_screen/search_screen.dart';
import '../../shared/components/components.dart';

class newLayout extends StatelessWidget {
  static const String routeName = "newLayout";
  bool pressedIconTheme = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = newsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, searchScreen());
                },
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeThemeMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              )
            ],
          ),
          body: cubit.screenWidget[cubit.currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          ),
        );
      },
    );
  }
}
