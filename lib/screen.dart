import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyari_entrance/ScoreScreen.dart';
import 'package:tyari_entrance/data.dart';


class Screen extends StatefulWidget {
  final List<Question> questions;


  @override
  _ScreenState createState() => _ScreenState();

  const Screen({Key? key, required this.questions}) :super(key: key);
}

class _ScreenState extends State<Screen> {

  String selectOption = '';
  int getMark = 1;
  int totalMark = 0;

  int currentIndex = 0;
  int count = 0;

  // final bool isSelected;
  // final bool answer;


  _ScreenState();

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Scaffold(
        appBar: AppBar(
          title: Text("Entrance"),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.tealAccent.shade700,
                  Colors.tealAccent.shade100
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.questions[currentIndex].question,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
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
                          if (option == currentQuestion.answer) {
                            getMark++;
                          }
                          Future.delayed(Duration(milliseconds: 200), () {
                            if (currentIndex ==
                                currentQuestion.options.length - 2) {
                              for (int i = currentIndex; i <
                                  currentQuestion.options.length; i++) {
                                print(i);
                              }
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          title: Text('Your Total Score is '),
                                          content: Text(getMark.toString()),
                                          actions: <Widget>[
                                          TextButton(
                                          onPressed: () => Navigator.pop(
                                  context, 'Cancel'),
                            child: Text("Cancel",style: TextStyle(color: Colors.black),),
                            ),
                            TextButton(
                            onPressed: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                            builder: (context)=>Screen(questions:questions,

                            ),
                            ),
                            )
                            ,
                            child: Text("Restart",style: TextStyle(color: Colors.black),),
                            ),
                            ],
                            )
                            );


                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //     builder: (context)=>ScoreScreen(
                            //       totalQuestion:widget.questions.length,
                            //       getMark: getMark ,
                            //     ),
                            //   ),
                            // );
                            return;
                            }
                            setState(() {
                            currentIndex++;
                            selectOption='';
                            });
                          }
                          );
                        },

                        title: Text(option,
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
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
// Color get getColor {
//   final bool selectOption;
//   if(!isSelected) {
//     return Colors.white;
//   }
//   if(isSelected==answer){
//     return Colors.green;
//   }
//   return Colors.red;
//
// }
}
