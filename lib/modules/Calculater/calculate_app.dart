import 'dart:math';

import 'package:first_project/modules/Calculater/calculaterButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calculateApp extends StatefulWidget {
  static const String routeName = 'calculate';

  @override
  State<calculateApp> createState() => _calculateAppState();
}

class _calculateAppState extends State<calculateApp> {
  String textPressed = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  textPressed == '' ? '0.0' : textPressed,
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculaterButton('7', returnString),
                calculaterButton('8', returnString),
                calculaterButton('9', returnString),
                calculaterButton('/', pressedOperator),
                calculaterButton('C', pressedClear),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculaterButton('6', returnString),
                calculaterButton('5', returnString),
                calculaterButton('4', returnString),
                calculaterButton('*', pressedOperator),
                calculaterButton('E', pressedDeleteLast),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculaterButton('3', returnString),
                calculaterButton('2', returnString),
                calculaterButton('1', returnString),
                calculaterButton('+', pressedOperator),
                calculaterButton('^', pressedOperator),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                calculaterButton('.', returnString),
                calculaterButton('0', returnString),
                calculaterButton('=', pressedEqual),
                calculaterButton('-', pressedOperator),
                calculaterButton('%', pressedOperator),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String operator = '';
  String LHS = '';

  //String RHS = '';
  // 25 + 5 -
//123
  void pressedDeleteLast(String s) {
    textPressed = textPressed.substring(0, textPressed.length - 1);
    setState(() {});
  }

  void pressedClear(String s) {
    if (s == 'C') {
      LHS = '';
      operator = '';
      textPressed = '';
      setState(() {});
    }
  }

  void pressedEqual(String s) {
    String RHS = textPressed;
    textPressed = calculateOperation(LHS, operator, RHS);
    operator = '';
    LHS = '';
    setState(() {});
  }

  void pressedOperator(String op) {
    if (operator.isEmpty) {
      LHS = textPressed;
      operator = op;
      textPressed = '';
      setState(() {});
    } else {
      String RHS = textPressed;
      LHS = calculateOperation(LHS, operator, RHS);
      operator = op;
      textPressed = '';
      setState(() {});
    }
  }

  String calculateOperation(String lhs, String op, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if (op == '+') {
      res = num1 + num2;
    } else if (op == '-') {
      res = num1 - num2;
    } else if (op == '*') {
      res = num1 * num2;
    } else if (op == '/') {
      res = num1 / num2;
    } else if (op == '%') {
      res = num1 % num2;
    } else {
      res = pow(num1, num2).toDouble();
    }
    return res.toString();
  }

  void returnString(String text) {
    setState(() {
      textPressed += text;
      print(textPressed);
    });
  }
}
