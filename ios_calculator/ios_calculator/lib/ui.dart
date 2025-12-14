import 'package:flutter/material.dart';
import 'package:ios_calculator/const.dart';
import 'package:ios_calculator/widgets.dart';
import 'package:math_expressions/math_expressions.dart';

String displayNum = '';
String result = '';

class UI extends StatefulWidget {
  const UI({super.key});

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            display(),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Button(
                        colors: lightGrey,
                        textColor: black,
                        str: 'AC',
                        func: () {
                          displayNum = '';
                          result = '';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: lightGrey,
                        textColor: black,
                        str: '+/-',
                        func: () {
                          displayNum += '+/-';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: lightGrey,
                        textColor: black,
                        str: '%',
                        func: () {
                          displayNum += '%';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: orange,
                        str: '/',
                        func: () {
                          displayNum += '/';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        str: '7',
                        func: () {
                          displayNum += '7';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '8',
                        func: () {
                          displayNum += '8';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '9',
                        func: () {
                          displayNum += '9';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: orange,
                        str: '*',
                        func: () {
                          displayNum += '*';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        str: '4',
                        func: () {
                          displayNum += '4';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '5',
                        func: () {
                          displayNum += '5';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '6',
                        func: () {
                          displayNum += '6';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: orange,
                        str: '-',
                        func: () {
                          displayNum += '-';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Button(
                        str: '1',
                        func: () {
                          displayNum += '1';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '2',
                        func: () {
                          displayNum += '2';
                          setState(() {});
                        },
                      ),
                      Button(
                        str: '3',
                        func: () {
                          displayNum += '3';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: orange,
                        str: '+',
                        func: () {
                          displayNum += '+';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      specialButton(() {
                        setState(() {
                          displayNum += '0';
                        });
                      }),

                      Button(
                        str: '.',
                        func: () {
                          displayNum += '.';
                          setState(() {});
                        },
                      ),
                      Button(
                        colors: orange,
                        str: '=',
                        func: () {
                          Parser p = Parser();
                          Expression exp = p.parse(displayNum);
                          ContextModel cm = ContextModel();
                          result = exp
                              .evaluate(EvaluationType.REAL, cm)
                              .toString();

                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
