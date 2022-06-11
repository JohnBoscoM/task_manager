// import 'package:flutter/material.dart';
// Widget buildList(ThemeProvider themeProvider, height, width) {
//   return Expanded(
//     child: Container(
//       decoration: BoxDecoration(
//         color: themeProvider.themeMode().blendBackgroundColor,
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(0), topLeft: Radius.circular(0)),
//       ),
//       child: ListView.builder(
//         itemCount: paymentBox.length,
//         itemBuilder: (context, index) {
//           final paymentItem = paymentBox.get(index);
//           if (paymentItem.deadline.isBefore(new DateTime.now()) &&
//               paymentItem.isChecked == false) {

//           }
//           return Container(
//               child: Center(

//                 child: Text("You have no missed bills, Keep it up!",
//                   style: TextStyle(fontFamily: "avenir", fontSize: 16, fontWeight: FontWeight.bold),),
//               ));
//         },
//       ),
//     ),
//   );
// }

// void itemChange(bool val, int index) {
//   setState(() {
//     pl.payments[index].isChecked = val;
//   });
// }
// }