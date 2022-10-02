import 'package:flutter/material.dart';

import '../../models/usermodel.dart';

class UserScreen extends StatelessWidget {
  List<userModel> user = [
    userModel(id: 1, name: 'Abdullah Zoghla', phone: '01018791950'),
    userModel(id: 2, name: 'Islam Zoghla', phone: '01093629957'),
    userModel(id: 3, name: 'Habeba Zoghla', phone: '01053329957'),
    userModel(id: 4, name: 'Hany Zoghla', phone: '01092219911'),
    userModel(id: 5, name: 'Fatma Elbialy', phone: '01020303512'),
    userModel(id: 6, name: 'Abdullah Zoghla', phone: '01018791950'),
    userModel(id: 7, name: 'Eslam Zoghla', phone: '01093629957'),
    userModel(id: 8, name: 'Habeba Zoghla', phone: '01053329957'),
    userModel(id: 9, name: 'Hany Zoghla', phone: '01092219911'),
    userModel(id: 10, name: 'Fatma Elbialy', phone: '01020303512'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'User Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => user_screen_item(user[index]),
          separatorBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 30),
                child: Container(
                  width: double.infinity,
                  height: 4,
                  color: Colors.grey,
                ),
              ),
          itemCount: user.length),
    );
  }

  Widget user_screen_item(userModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Text(
                '${user.id}',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  user.phone,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
}
