import 'package:flutter/material.dart';

class boardWidget extends StatelessWidget {
  String text = '';
  int index;
  Function onClick;

  boardWidget(this.text, this.index, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.all(2),
        child: ElevatedButton(
          onPressed: () {
            onClick(index);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
