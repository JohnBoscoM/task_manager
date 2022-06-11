import 'package:cloud_firestore/cloud_firestore.dart';

class TaskService {
  final CollectionReference _taskCollection =
      FirebaseFirestore.instance.collection("Task");

  Future getAllTasks() async {
    _taskCollection.orderBy("DueDate", descending: false).get();
  }
}
