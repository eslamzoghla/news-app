import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_project/shared/cubit/cubit.dart';
import 'package:first_project/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../modules/news_app/web_view/web_view_screen.dart';

Widget defaultButton({
  required String text,
  double width = double.infinity,
  Color background = defaultColor,
  double radius = 0.0,
  bool isUpperCase = true,
  void Function()? fun,
  double marginButton = 0.0,
}) =>
    Container(
      width: width,
      margin: EdgeInsetsDirectional.all(marginButton),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: fun,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndReplace(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

//final Function validate;
Widget defaultFormField({
  required String testLabel,
  required IconData prefix,
  IconData? suffix,
  required TextEditingController control,
  required TextInputType type,
  required validate,
  Function()? onTap,
  TextStyle? typingStyle,
  TextStyle? labelStyle,
  Color? iconColor,
  void Function(String)? onChange,
  bool isPassword = false,
  void Function()? suffixPress,
}) =>
    TextFormField(
      decoration: InputDecoration(
        labelText: testLabel,
        labelStyle: labelStyle,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
          color: iconColor,
        ),
        // prefixIconColor: Colors.white,
        suffixIcon: IconButton(
            onPressed: suffixPress,
            icon: Icon(
              suffix,
            )),
      ),
      style: typingStyle,
      controller: control,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      obscureText: isPassword,
    );

defaultTaskShow(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple,
              child: Text(
                '${model['time']}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${model['data']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.check_box_rounded,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateDatabase(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDatabase(id: model['id']);
      },
    );

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, webViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 150.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // mainAxisSize: MainAxisSize.min,

                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 2,
        color: Colors.grey,
      ),
    );

Widget tasksBuilderEmptyDatabase({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context) => ListView.separated(
            itemBuilder: (context, index) =>
                defaultTaskShow(tasks[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: tasks.length),
        fallback: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red,
                    size: 100,
                  ),
                  Text(
                    'No tasks yet, '
                    'please enter new tasks!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ));

Widget buildArticleConditialBuilder(list, context, {isSearch = false}) =>
    ConditionalBuilder(
        condition: list.length > 0,
        builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticleItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10),
        fallback: (context) => isSearch
            ? Container()
            : Center(child: CircularProgressIndicator()));
