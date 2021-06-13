
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
      question: "Which of the following halogen acids is a liquid ?",
      options: ["Hydrogen Fluoride","Hydrogen Chloride","Hydrogen Bromide","Hydrogen Iodide"],
      answer: "Hydrogen Fluoride"
       ),
  Question(
      id: "3",
      question: "The temperature of sun is measured with__?",
      options: ["Platinum thermometer","Gas thermometer","Pyrometer","Vapour pressure thermometer"],
      answer: "Pyrometer"
        ),
  Question(
      id: "4",
      question: "Peter is .....MBBS.",
      options: ["a","is","are","an"],
      answer: "an"
  ),
  Question(
      id: "5",
      question: "The ratio of inertial mass to gravitational mass of an object?",
      options: ["1","1/2","2","No Fixed Number"],
      answer: "1"
  ),
];