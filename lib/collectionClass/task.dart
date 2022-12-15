class Task {
  String title ;
  String description ;
  int date ;
  String id ;
  bool isDone ;

  Task ({
    this.id = "" , this.isDone = false ,
    required this.title , required this.description ,
    required this.date
});

  Task.fromJson(Map<String, Object?> json)
      : this(
    title: json['title']! as String,
    description: json['description']! as String,
    date: json['date']! as int,
    isDone: json['isDone']! as bool,
    id: json['id']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'id': id,
    };
  }

}
