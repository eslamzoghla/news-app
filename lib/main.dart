import 'package:first_project/network/remote/dio_helper.dart';
import 'package:first_project/shared/components/contants.dart';
import 'package:first_project/shared/components/observation.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_states.dart';
import 'package:first_project/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/news_app/business_news/business_screen.dart';
import 'network/local/cache_helper.dart';

void main() async {
  // used to print all moves in program and this block work nice or not
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await cashesHelper.init();

  bool? darkMode = cashesHelper.getData(key: 'darkMode');

  bool? onBoardSaving = cashesHelper.getData(key: 'onBoarding');

  token = cashesHelper.getData(key: 'token');

  print(onBoardSaving);
  runApp(MyApp(darkMode: darkMode, startWidget: businessScreen()));
}

class MyApp extends StatelessWidget {
  final bool? darkMode;
  final Widget? startWidget;

  MyApp({this.darkMode, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..changeThemeMode(isDark: darkMode),
        ),
        BlocProvider(
          create: (BuildContext context) => newsCubit()
            ..getBusiness()
            ..getScience()
            ..getSports(),
        ),
      ],
      child: BlocConsumer<newsCubit, newsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // to hide red bar in top screen
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
