import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home layout';

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is AppInsertDatabaseState) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.Titles[cubit.selectedIndex],
            ),
            backgroundColor: Colors.deepPurple,
          ),
          body: ConditionalBuilder(
            condition: true,
            builder: (context) => cubit.Screens[cubit.selectedIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              if (cubit.isShownDataSheet) {
                if (formKey.currentState!.validate()) {
                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dataController.text);
                }
              } else {
                scaffoldKey.currentState
                    ?.showBottomSheet(
                      (context) => Container(
                        color: Colors.grey[200],
                        padding: EdgeInsetsDirectional.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                  testLabel: 'Task Title',
                                  prefix: Icons.title,
                                  control: titleController,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return ("You should enter data");
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                testLabel: 'Time Title',
                                prefix: Icons.watch_later_outlined,
                                control: timeController,
                                type: TextInputType.datetime,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ("You should enter data");
                                  }
                                  return null;
                                },
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now())
                                      .then((value) {
                                    timeController.text =
                                        value!.format(context).toString();
                                    //print(value?.format(context));
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                testLabel: 'Data Title',
                                prefix: Icons.calendar_today_outlined,
                                control: dataController,
                                type: TextInputType.datetime,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return ("You should enter data");
                                  }
                                  return null;
                                },
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-10-08'))
                                      .then((value) {
                                    dataController.text =
                                        (DateFormat.yMMMd().format(value!));
                                    FocusScope.of(context).unfocus();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  cubit.onClickButton(shownSheet: false, icon: Icons.edit);
                });
                cubit.onClickButton(shownSheet: true, icon: Icons.add);
              }
            },
            child: Icon(
              cubit.fabIcon,
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            child: BottomNavigationBar(
              fixedColor: Colors.white,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.deepPurple,
              selectedFontSize: 20,
              //unselectedFontSize: 14,
              selectedIconTheme: IconThemeData(size: 26),
              unselectedIconTheme: IconThemeData(size: 20),
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'New tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive tasks',
                ),
              ],
              currentIndex: AppCubit.get(context).selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.currentIndex(index);
              },
            ),
          ),
        );
      }),
    );
  }

// Future<String> getName() async {
//   return 'Eslam Zoghla';
// }

}
