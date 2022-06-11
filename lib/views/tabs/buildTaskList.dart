import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Widget buildTaskList(context, snapshot){
//   return StreamBuilder(
//     stream:  FirebaseFirestore.instance.collection("Task").snapshots(),
//     builder: (context, snapshot){
//       if(!snapshot.hasData) return Text("No Tasks availble");
//       return ListView.builder
//       (
//         // itemCount: snapshot.data?.documents.length,
//         // itemBuilder: (context, index){
//         //     child: Container();
//         // }
        
//       )
//     }
// }