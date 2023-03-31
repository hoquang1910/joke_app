class JokeStory {
  int? id;
  String? jokeText;

  JokeStory({this.id, this.jokeText});

  JokeStory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jokeText = json['jokeText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['jokeText'] = jokeText;
    return data;
  }
}
