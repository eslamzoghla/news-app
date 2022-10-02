import 'package:flutter/material.dart';

class news extends StatelessWidget {
  String title;
  String imagePath;

  news(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(2),
      padding: EdgeInsetsDirectional.only(start: 1.0, top: 1.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            imagePath,
            width: 190.0,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: EdgeInsetsDirectional.all(5),
              color: Colors.pink.withOpacity(0.7),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
