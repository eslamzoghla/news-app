import 'package:bloc/bloc.dart';
import 'package:first_project/layout/news_app/news_layout.dart';
import 'package:first_project/network/remote/dio_helper.dart';
import 'package:first_project/shared/components/observation.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/news_cubit/news_cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/local/cache_helper.dart';

void main() async {
  // used to print all moves in program and this block work nice or not
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await cashesHelper.init();

  bool? darkMode = cashesHelper.getBoolean(key: 'darkMode');
  runApp(MyApp(darkMode));
}

class MyApp extends StatelessWidget {
  final bool? darkMode;

  MyApp(this.darkMode);

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
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // to hide red bar in top screen
            theme: ThemeData(
              primaryColor: Colors.black,
              primarySwatch: Colors.deepOrange,
              // to make all material to this color
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                color: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 50.0,
                selectedItemColor: Colors.deepOrange,
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.deepOrange,
              // to make all material to this color
              scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(31, 31, 31, 1.0),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                color: Color.fromRGBO(31, 31, 31, 1.0),
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                elevation: 50.0,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.deepOrange,
                backgroundColor: Color.fromRGBO(31, 31, 31, 1.0),
              ),
            ),
            themeMode: AppCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            routes: {
              // LoginScreen.routeName: (myContext) => LoginScreen(),
              // MassengerScreen.routeName: (myContext) => MassengerScreen(),
              // home_screen.routeName: (myContext) => home_screen(),
              // HomeLayout.routeName: (myContext) => HomeLayout(),
              // CounterScreen.routeName: (myContext) => CounterScreen(),
              // buttonIncrement.routeName: (myContext) => buttonIncrement(),
              // calculateApp.routeName: (myContext) => calculateApp(),
              // XOGame.routeName: (myContext) => XOGame(),
              newLayout.routeName: (myContext) => newLayout(),
            },
            initialRoute: newLayout.routeName,
          );
        },
      ),
    );
  }
}
