class Task {
  late String id;
  late String name;
  late String description;
  late DateTime date;
  late bool status;

  Task(
      {required this.id,
      required this.name,
      required this.description,
      required this.status,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(), // Store date as ISO 8601 string
      'status': status ? 1 : 0, // Store boolean as integer (0 or 1)
    };
  }


  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    date = DateTime.parse(map['date']); // Parse ISO 8601 string to DateTime
    status = map['status'] == 1; // Convert integer to boolean
  }
  void toggleStatus() {
    status = !status;
  }
}
