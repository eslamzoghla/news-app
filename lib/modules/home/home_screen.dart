import 'package:first_project/modules/home/news.dart';
import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  static const String routeName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 35,
            ),
            onPressed: () {
              print('Search');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.all(2),
                  alignment: Alignment.center,
                  color: Colors.pink,
                  child: Text(
                    'News',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  width: 190,
                  height: 50,
                ),
                Container(
                  margin: EdgeInsetsDirectional.all(2),
                  alignment: Alignment.center,
                  color: Colors.pink,
                  child: Text(
                    'Catagoires',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  width: 190,
                  height: 50,
                ),
              ],
            ),
            Row(
              children: [
                news('Tech', 'assets/images/tech.jpg'),
                news('Cars', 'assets/images/cars.jpg'),
              ],
            ),
            Row(
              children: [
                news('Cooking', 'assets/images/cook.jpg'),
                news('Healthy', 'assets/images/healt.png'),
              ],
            ),
            Row(
              children: [
                news('Sport', 'assets/images/sport.jpg'),
                news('Economy', 'assets/images/econ.jpg'),
              ],
            ),
            Row(
              children: [
                news('Tourism', 'assets/images/git.jpg'),
                news('Politics', 'assets/images/cey.jpg'),
              ],
            ),
            Row(
              children: [
                news('knowledge', 'assets/images/akn.jpg'),
                news('Beauty', 'assets/images/7ao.jpg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
