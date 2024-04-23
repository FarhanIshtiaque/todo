class Task {
  String? id;
  String? name;
  String? description;
  DateTime? date;
  bool? status;
  Task({this.id, this.name, this.description, this.status,this.date});

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