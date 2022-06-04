class Info {
  String? userId;
  int? id;
  String? title;

  Info({this.id, this.title, this.userId});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
