class Task {
  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      this.isDone = false});
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          date: json['date'] as int,
          isDone: json['isDone'] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "date": date,
    };
  }
}


//map=>task  from firestore
//task=>map  to firestore  ,kind of map <String,dynamic>