import 'package:flutter/material.dart';

class calculaterButton extends StatelessWidget {
  String text = '';
  Function onClick;

  calculaterButton(this.text, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsetsDirectional.all(2),
        child: ElevatedButton(
          onPressed: () {
            onClick(text);
          },
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
