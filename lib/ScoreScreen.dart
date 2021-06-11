import 'package:flutter/material.dart';


class ScoreScreen extends StatelessWidget {
   ScoreScreen(
      {Key? key, required this.getMark, required this.totalQuestion})
      : super(key: key);

  final int getMark;
  final int totalQuestion;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.tealAccent.shade700, Colors.tealAccent.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SizedBox.expand(
          child: Container(
            child: Center(
              child: Text(getMark.toString() + " out of total questions " + totalQuestion.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white

              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
