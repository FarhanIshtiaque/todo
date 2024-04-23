class Task {
 late String id;
 late String name;
 late String description;
 late DateTime date;
  late bool status;
  Task({required this.id, required this.name, required this.description, required this.status,required this.date});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    date = json['date'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['status'] = status;
    data['data'] = date;

    return data;
  }
}