import 'package:flutter/material.dart';

// Colors
const Color darkGrey = Color(0xFF333333);
const Color white = Colors.white;

class Button extends StatelessWidget {
  final Color colors;
  final String str;
  final Color textColor;
  final VoidCallback onTap;

  const Button({
    super.key,
    this.colors = darkGrey,
    required this.str,
    this.textColor = white,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0), // Adds gap between buttons
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
            child: Center(
              child: FittedBox(
                // Scales text to fit the button
                fit: BoxFit.scaleDown,
                child: Text(
                  str,
                  style: TextStyle(fontSize: 32, color: textColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Expanded display(String input, String result) {
  return Expanded(
    flex: 2, // Gives the display 2x more space than a single button row
    child: Container(
      width: double.infinity,
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Input Text (Scales automatically)
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              input,
              style: const TextStyle(
                fontSize: 64, // Large base size, will shrink if needed
                color: white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Result Text
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: const TextStyle(fontSize: 30, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}

// Special "0" Button (Wide Button)
Widget specialButton(VoidCallback onTap) {
  return Expanded(
    flex: 2, // Takes up the width of 2 buttons
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
            color: darkGrey,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Text('0', style: TextStyle(fontSize: 32, color: white)),
        ),
      ),
    ),
  );
}
