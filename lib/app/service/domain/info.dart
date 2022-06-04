class Info {
  int? userId;
  int? id;
  String? title;

  Info({this.id, this.title, this.userId});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      userId: json['userId'],
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}
