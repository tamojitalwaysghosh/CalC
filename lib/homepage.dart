import 'package:calc/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    "ANS",
    '0',
    '.',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text(
          "A Simple Calculator",
          style: TextStyle(
              color: Colors.black, fontFamily: 'Quicksand', fontSize: 24),
        ),
        centerTitle: true,
        elevation: 7,
        backgroundColor: Colors.white,
      ),*/
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Calculations :',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(4),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQestion,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            fontSize: 27),
                      ),
                    ),
                  ),
                  Text(
                    'Solution:',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quicksand',
                        fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    child: Container(
                      padding: EdgeInsets.only(right: 8, left: 8, top: 8),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                            color: Color.fromARGB(255, 116, 111, 119),
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w600,
                            fontSize: 45),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: buttons.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQestion = '';
                            // userAnswer = '';
                          });
                        },
                        color: Color.fromARGB(255, 92, 105, 157),
                        textColor: Colors.white,
                        buttonText: buttons[index]);
                  } else if (index == 1) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQestion = userQestion.substring(
                                0, userQestion.length - 1);
                          });
                        },
                        color: Color.fromARGB(255, 250, 87, 87),
                        textColor: Colors.white,
                        buttonText: buttons[index]);
                  } else if (index == buttons.length - 1) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            enterPressed();
                          });
                        },
                        color: Color.fromARGB(255, 11, 247, 121),
                        textColor: Colors.white,
                        buttonText: buttons[index]);
                  } else if (index == buttons.length - 4) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQestion += userAnswer;
                          });
                        },
                        color: Color.fromARGB(255, 254, 255, 254),
                        textColor: Color.fromARGB(255, 11, 247, 121),
                        buttonText: buttons[index]);
                  } else {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            userQestion += buttons[index];
                          });
                        },
                        color: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.white,
                        textColor: isOperator(buttons[index])
                            ? Color.fromARGB(255, 11, 247, 121)
                            : Colors.black.withOpacity(0.7),
                        buttonText: buttons[index]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' ||
        x == 'ANS' ||
        x == '/' ||
        x == 'X' ||
        x == '+' ||
        x == '=' ||
        x == '-') {
      return true;
    } else {
      return false;
    }
  }

  void enterPressed() {
    String finalQuestion = userQestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}
