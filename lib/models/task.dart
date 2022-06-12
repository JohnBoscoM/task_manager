import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? title;
  DateTime? dueDate;
  List<dynamic>? tags;
  bool? isCompleted;
  int? urgencyLevel;
  String? userId;

  Task();

  Map<String, dynamic> toJson() => {
        'Title': title,
        'DueDate': dueDate,
        'Tags': tags,
        'IsCompleted': isCompleted,
        'UrgencyLevel': urgencyLevel,
        'UserId': userId
      };

  Task.fromSnapshot(snapshot)
      : title = snapshot.data()['Title'],
        dueDate = (snapshot.data()['DueDate'] as Timestamp).toDate(),
        tags = snapshot.data()['Tags'],
        isCompleted = snapshot.data()['IsCompleted'],
        urgencyLevel = snapshot.data()['UrgencyLevel'],
        userId = snapshot.data()['UserId'];
}
