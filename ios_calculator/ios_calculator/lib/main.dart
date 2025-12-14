import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'ui.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    ),
  );
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "0";
  String result = "0";

  final Color orange = const Color(0xFFFF9500);
  final Color lightGrey = const Color(0xFFA5A5A5);
  final Color darkGrey = const Color(0xFF333333);

  void buttonPressed(String btnText) {
    setState(() {
      if (btnText == "AC") {
        input = "0";
        result = "0";
      } else if (btnText == "⌫") {
        if (input.isNotEmpty && input != "0") {
          input = input.substring(0, input.length - 1);
          if (input.isEmpty) input = "0";
        }
      } else if (btnText == "=") {
        try {
          String expression = input.replaceAll('x', '*').replaceAll('÷', '/');
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);

          result = eval.toString();
          if (result.endsWith(".0")) {
            result = result.substring(0, result.length - 2);
          }
          input = result;
        } catch (e) {
          result = "Error";
        }
      } else {
        if (input == "0") {
          input = btnText;
        } else {
          input += btnText;
        }
      }
    });
  }

  // Helper widget to make code cleaner
  Widget buildButtonRow(List<Widget> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Makes buttons fill height
        children: buttons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // Protects from notches/home bars
        child: Column(
          children: [
            // Display Area
            display(input, result),

            // Keypad
            buildButtonRow([
              Button(
                str: "AC",
                colors: lightGrey,
                textColor: Colors.black,
                onTap: () => buttonPressed("AC"),
              ),
              Button(
                str: "⌫",
                colors: lightGrey,
                textColor: Colors.black,
                onTap: () => buttonPressed("⌫"),
              ),
              Button(
                str: "%",
                colors: lightGrey,
                textColor: Colors.black,
                onTap: () => buttonPressed("%"),
              ),
              Button(str: "÷", colors: orange, onTap: () => buttonPressed("÷")),
            ]),
            buildButtonRow([
              Button(str: "7", onTap: () => buttonPressed("7")),
              Button(str: "8", onTap: () => buttonPressed("8")),
              Button(str: "9", onTap: () => buttonPressed("9")),
              Button(str: "x", colors: orange, onTap: () => buttonPressed("x")),
            ]),
            buildButtonRow([
              Button(str: "4", onTap: () => buttonPressed("4")),
              Button(str: "5", onTap: () => buttonPressed("5")),
              Button(str: "6", onTap: () => buttonPressed("6")),
              Button(str: "-", colors: orange, onTap: () => buttonPressed("-")),
            ]),
            buildButtonRow([
              Button(str: "1", onTap: () => buttonPressed("1")),
              Button(str: "2", onTap: () => buttonPressed("2")),
              Button(str: "3", onTap: () => buttonPressed("3")),
              Button(str: "+", colors: orange, onTap: () => buttonPressed("+")),
            ]),
            buildButtonRow([
              specialButton(() => buttonPressed("0")),
              Button(str: ".", onTap: () => buttonPressed(".")),
              Button(str: "=", colors: orange, onTap: () => buttonPressed("=")),
            ]),
          ],
        ),
      ),
    );
  }
}
