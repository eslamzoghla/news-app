import 'package:flutter/material.dart';

import 'boardWidget.dart';

class XOGame extends StatefulWidget {
  static const String routeName = 'xogame';

  @override
  State<XOGame> createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Games'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player 1',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$scorePlayer1',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Player 2',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '$scorePlayer2',
                        style: TextStyle(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  boardWidget(boardState[0], 0, letterChoose),
                  boardWidget(boardState[1], 1, letterChoose),
                  boardWidget(boardState[2], 2, letterChoose),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  boardWidget(boardState[3], 3, letterChoose),
                  boardWidget(boardState[4], 4, letterChoose),
                  boardWidget(boardState[5], 5, letterChoose),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  boardWidget(boardState[6], 6, letterChoose),
                  boardWidget(boardState[7], 7, letterChoose),
                  boardWidget(boardState[8], 8, letterChoose),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 0;
  int scorePlayer1 = 0;
  int scorePlayer2 = 0;

  void letterChoose(int index) {
    setState(() {
      if (boardState[index].isEmpty) {
        boardState[index] = counter % 2 == 0 ? 'X' : 'O';
        counter++;
        if (playerWinner('X')) {
          scorePlayer1 += 1;
          resetBoard();
        } else if (playerWinner('O')) {
          scorePlayer2 += 1;
          resetBoard();
        } else if (counter == 9) {
          resetBoard();
        }
      }
    });
  }

  bool playerWinner(String currentState) {
    bool winner = false;
    // Win with rows
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == currentState &&
          boardState[i + 1] == currentState &&
          boardState[i + 2] == currentState) {
        winner = true;
      }
    }
    // Win with Column
    // 0 3 6 = 1 4 7 = 2 5 8
    for (int j = 0; j < 3; j++) {
      if (boardState[j] == currentState &&
          boardState[j + 3] == currentState &&
          boardState[j + 6] == currentState) {
        winner = true;
      }
    }
    // diagonal
    if (boardState[0] == currentState &&
        boardState[4] == currentState &&
        boardState[8] == currentState) {
      winner = true;
    }

    if (boardState[2] == currentState &&
        boardState[4] == currentState &&
        boardState[6] == currentState) {
      winner = true;
    }
    return winner;
  }

  void resetBoard() {
    counter = 0;
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }
}
