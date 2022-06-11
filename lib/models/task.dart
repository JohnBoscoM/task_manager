class Task {
  String? title;
  DateTime? dueDate;
  String? tags;
  bool? isCompleted;
  int? urgencyLevel;
  int? userId;

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
        dueDate = snapshot.data()['DueData'].toDate(),
        tags = snapshot.data()['Tags'],
        isCompleted = snapshot.data()['IsCompleted'],
        urgencyLevel = snapshot.data()['UrgencyLevel'],
        userId = snapshot.data()['UserId'];
}
