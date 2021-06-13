import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyari_entrance/ScoreScreen.dart';
import 'package:tyari_entrance/data.dart';

class Screen extends StatefulWidget {
  final List<Question> questions;

  @override
  _ScreenState createState() => _ScreenState();

  const Screen({Key? key, required this.questions}) : super(key: key);
}

class _ScreenState extends State<Screen> {
  String selectOption = '';
  int getMark = 0;
  double totalMark = 0;
  int wrong = 0;


  int currentIndex = 0;
  int count = 1;

  // final bool isSelected;
  // final bool answer;

  _ScreenState();

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];


    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text((currentIndex + 1).toString()),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent.shade700,
                  Colors.blueAccent.shade100
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.questions[currentIndex].question,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final option = currentQuestion.options[index];
                      return Card(
                        color: selectOption == option &&
                                option == currentQuestion.answer
                            ? Colors.green
                            : null,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              // print(currentQuestion.options.length.toString());

                              selectOption = option;
                            });
                            if (selectOption == currentQuestion.answer) {
                              getMark++;



                            }
                            else{
                              wrong++;

                            }
                            totalMark=getMark-wrong*0.1;

                            Future.delayed(Duration(milliseconds: 200), () {
                              // if (selectOption == currentQuestion.answer){
                              //   totalMark=(getMark-wrong*0.1).toStringAsFixed(2) as double;
                              if (currentIndex == questions.length - 1) {
                                // print( currentIndex);
                                for (int i = currentIndex; i < currentQuestion.options.length;
                                    i++) {
                                  print(i);
                                }
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('Your Total Score is '),
                                          content: Text(" Right : " +
                                              getMark.toString() +
                                              "\n  wrong   :" +
                                              wrong.toString() +
                                              "\n Total_Score is :" + totalMark.toStringAsFixed(2),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                          ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                  fontSize: 20,

                                                    color: Colors.black),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) => Screen(
                                                    questions: questions,
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                "Restart",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        )
                                );


                                return;
                              }
                              setState(() {
                                currentIndex++;
                                selectOption = '';
                              });
                            });
                          },
                          title: Text(option,
                              style: TextStyle(
                                color: Colors.black,
                              )),
                        ),
                      );
                    },
                    itemCount: currentQuestion.options.length,
                  ),
                )
              ],
            )
        )
    );
  }


}
// class AnswerTile extends StatelessWidget {
//   const AnswerTile({Key? key,required this.isSelected, required this.options, required this.answer}) : super(key: key);
//
//   final bool isSelected;
//   final String options;
//   final String answer;
//
//   Color  get cardColor {
//     if (!isSelected )
//       return Colors.white;
//     if (options==answer){
//       return Colors.green;
//     }
//     return Colors.redAccent;
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: cardColor,
//       child: ListTile(
//         title: Text(options),
//       ),
//     );
//   }
// }
