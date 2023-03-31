import 'dart:convert';

import 'package:joker/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  //use share preferences to save and get value
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final stringList = user.jokeDone!.map((item) => item.toString()).toList();
    prefs.setInt("userId", user.userId!);
    prefs.setStringList("jokeDone",stringList);
    return true;
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int? userId = prefs.getInt("userId")??0;
    List? jokeDone = prefs.getStringList("jokeDone")??[];

    return User(userId: userId, jokeDone: jokeDone);
  }
}
