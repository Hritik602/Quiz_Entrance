
 class Question {
   final String id;
  final String question;
  final List<String> options;
  final String answer;

  Question({required this.id,required this.question,required this.options,required this.answer});
// ignore: empty_constructor_bodies
}
List <Question> questions=[
  Question(
      id: "1",
      question: "Which of the following is not Os ?",
      options: ["Apple","Windows","Linux","Mac OS"],
      answer: "Apple"
  ),
  Question(
      id: "2",
      question: "Which of the following is  Os ?",
      options: ["Pee","Apples","Windows","Mango"],
      answer: "Windows"
       ),
  Question(
      id: "3",
      question: "Which of the following is not fruit ?",
      options: ["Apple","Mango","Litchi","Mac OS"],
      answer: "Apple"
        ),
];