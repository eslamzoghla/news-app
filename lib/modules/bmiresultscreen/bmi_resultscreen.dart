import 'package:flutter/material.dart';

class bmiResult extends StatelessWidget {
  final int result;
  final bool gander;
  final int age;

  bmiResult({
    required this.age,
    required this.gander,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'BMI Result',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gander: ${gander ? 'Male' : 'Female'}',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Result: $result',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'Age: $age',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
