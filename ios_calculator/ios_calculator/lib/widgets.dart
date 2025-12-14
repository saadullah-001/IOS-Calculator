// import 'package:flutter/material.dart';
// import 'package:ios_calculator/const.dart';
// import 'package:ios_calculator/ui.dart';

// class Button extends StatelessWidget {
//   final Color colors;
//   final String str;
//   final Color textColor;
//   final func;
//   const Button({
//     super.key,
//     this.colors = darkGrey,
//     required this.str,
//     this.textColor = white,
//     this.func,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: InkWell(
//         onTap: func,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 11),
//           height: 120,
//           decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
//           child: Center(
//             child: Text(str, style: TextStyle(fontSize: 48, color: textColor)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Expanded display() {
//   return Expanded(
//     child: Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 24, right: 36, bottom: 24),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(displayNum, style: TextStyle(fontSize: 36, color: white)),
//           Text(result, style: TextStyle(fontSize: 36, color: white)),
//         ],
//       ),
//     ),
//   );
// }

// Expanded specialButton(VoidCallback onTap) {
//   return Expanded(
//     flex: 2,
//     child: InkWell(
//       onTap: onTap,
//       child: Container(
//         alignment: Alignment.centerLeft,
//         margin: EdgeInsets.only(bottom: 11, left: 18, right: 11),
//         padding: EdgeInsets.only(left: 60),
//         height: 120,
//         decoration: BoxDecoration(
//           color: darkGrey,
//           borderRadius: BorderRadius.circular(100),
//         ),
//         child: Text('0', style: TextStyle(fontSize: 48, color: white)),
//       ),
//     ),
//   );
// }
