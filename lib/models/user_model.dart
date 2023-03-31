class User {
  int? userId;
  List? jokeDone;

  User({this.userId, this.jokeDone});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'] ?? 0;
    jokeDone = json['jokeDone'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userId'] = userId ?? 0;
    data['jokeDone'] = jokeDone ?? [];
    return data;
  }
}
