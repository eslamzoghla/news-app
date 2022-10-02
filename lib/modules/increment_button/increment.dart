import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buttonIncrement extends StatefulWidget {
  static const String routeName = "increment";

  @override
  State<StatefulWidget> createState() => buttonIncrementState();
}

class buttonIncrementState extends State<buttonIncrement> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  counter++;
                  print(counter);
                });
              },
              child: Text(
                'Increment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
    );
  }
}
