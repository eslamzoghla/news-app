import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import '../../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  // Global object
  static AppCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  late Database database;
  IconData fabIcon = Icons.edit;
  bool isShownDataSheet = false;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  List<String> Titles = [
    'New tasks',
    'Done tasks',
    'Archive tasks',
  ];

  void currentIndex(int index) {
    selectedIndex = index;
    emit(AppChangeBottonNavBarState());
  }

  //
  // void IconEditButton(){
  //   fabIcon = Icons.edit;
  //   emit(AppButtonIconEditState());
  // }
  //
  // void IconAddButton(){
  //   fabIcon = Icons.add;
  //   emit(AppButtonIconAddState());
  // }

  void onClickButton({@required bool? shownSheet, @required IconData? icon}) {
    isShownDataSheet = shownSheet!;
    fabIcon = icon!;
    emit(AppButtonIconState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1, // First table
      onCreate: (database, version) async {
        print('Database was Created');
        try {
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, time TEXT, status TEXT)');
          print('Table was created');
        } catch (error) {
          print('Error on Creating table in database ${error.toString()}');
        }
      },
      onOpen: (database) {
        print('Database was opened');
        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) {
    return database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks (title, data, time, status) VALUES ("$title", "$date", "$time", "new")')
          .then((value) {
        print('$value Was added to table');
      }).catchError((error) {
        print('Error on adding data into database ${error.toString()}');
      });
    }).then((value) {
      emit(AppInsertDatabaseState());
      getDataFromDatabase(database);
    });
  }

  void updateDatabase({@required String? status, @required int? id}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteDatabase({@required int? id}) {
    database.rawUpdate('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool darkMode = false;

  void changeThemeMode({bool? isDark}) {
    if (isDark != null) {
      darkMode = isDark;
      // print('Done');
      emit(newsAppThemeModeState());
    } else {
      darkMode = !darkMode;
      // print('saved  $darkMode');
      cashesHelper.putBoolean(key: 'darkMode', value: darkMode).then((value) {
        emit(newsAppThemeModeState());
      });
    }
  }
}
