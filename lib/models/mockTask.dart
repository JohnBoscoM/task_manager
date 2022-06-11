class MockTask {
  late String title;
  late DateTime deadline;
  late List<String> tags;
  late Urgency urgency;

  MockTask(
      String title, DateTime deadline, List<String> tags, Urgency urgency) {
    this.title = title;
    this.deadline = deadline;
    this.tags = tags;
    this.urgency = urgency;
  }
}

enum Urgency { low, med, high }


