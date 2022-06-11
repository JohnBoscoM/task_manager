// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';


// class TodoList {
//   List<Task> taskList = [];
//  // late SharedPreferences sharedPreferences;

//   TodoList() {
//     initSharedPreference();
//   }
//   void initSharedPreference() async {
//   //  sharedPreferences = await SharedPreferences.getInstance();
//   }

//   Widget buildList() {
//  //   taskList = loadData(sharedPreferences, taskList);
//     return Expanded(
//       child: Container(
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(0), topLeft: Radius.circular(0)),
//         ),
//         child: ListView.builder(
//           itemCount: taskList.length,
//           itemBuilder: (context, index) {
//            // final paymentItem = paymentBox.get(index);
//             return Dismissible(
//               background: Container(
//                 child: Text(
//                   "The task was deleted",
//                   textScaleFactor: 1.2,
//                   style: GoogleFonts.manrope(
//                       color: Colors.black26, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               key: Key("paymentItem.toString()"),
//               onDismissed: (direction) {
//                 Scaffold.of(context).showSnackBar(new SnackBar(
//                   content: Text("Task Removed", style: GoogleFonts.manrope()),
//                 ));
//               },
//             //  ignore: unnecessary_new
//               child: new Container(
//                 padding: new EdgeInsets.all(10),
//                 elevation: 0,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                 ),
//                 margin: new EdgeInsets.all(10),
//                 child: Column(
//                   children: <Widget>[
//                     ignore: unnecessary_new
//                     new ListTile(
//                       onLongPress: () {},
//                       leading: Container(
//                         height: 30,
//                         width: 30,
//                         margin: EdgeInsets.only(right: 0),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.blueAccent.shade200),
//                         child: Icon(
//                           Icons.check,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),

//                       Checkbox(
//                           value: list[index].completed,
//                           onChanged: (bool value) {
//                             setState(() {
//                               list[index].completed = value;
//                             });
//                           }),
//                       isThreeLine: false,
//                       dense: true,
//                       font change
//                       contentPadding: EdgeInsets.all(1),
//                       title: Text(
//                         taskList[index].title,
//                         style: GoogleFonts.manrope(
//                             color: Colors.black87,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 0.5),
//                         textAlign: TextAlign.left,
//                       ),
//                       subtitle: Container(
//                         child: Text(
//                           "paymentItem.deadline.toString().substring(0, 10)",
//                           style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: "avenir",
//                               fontWeight: FontWeight.w600,
//                               letterSpacing: 0.5),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       trailing: Text(
//                         taskList[index].hours.toString(),
//                         style: GoogleFonts.manrope(
//                             color: Colors.black38,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w800,
//                             letterSpacing: 0.5),
//                       ),

//                       onChanged: (bool val) {
//                         itemChange(val, index, list);
//                       }
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   void itemChange(bool val, int index, List<Task> list) {
//     setState(() {
//       list[index].completed = val;
//     });
//   }
// }
