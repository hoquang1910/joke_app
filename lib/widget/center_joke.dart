import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:joker/core/core.dart';
import 'package:joker/models/joke_model.dart';
import 'package:joker/models/user_model.dart';
import 'package:joker/preferences/user_preferences.dart';
import 'package:joker/theme/app_style.dart';
import 'package:joker/widget/button.dart';

class CenterJoke extends StatefulWidget {
  const CenterJoke({super.key});

  @override
  State<CenterJoke> createState() => _CenterJokeState();
}

class _CenterJokeState extends State<CenterJoke> {
  List decodeJokeJson = [];
  List<JokeStory> jokeStory = [];
  List decodeUserJson = [];
  User user = User();
  List<int> notDoneJoke = [];
  final _random = new Random();
  int number = 0;
  Future<User?> getUser() => UserPreferences().getUser();

  _initData() async {
    //get data from file json
    await rootBundle.loadString("assets/json/joke.json").then((value) {
      setState(() {
        decodeJokeJson = json.decode(value);
        jokeStory = decodeJokeJson.map((id) => JokeStory.fromJson(id)).toList();
      });
    });
    //get data for device
    await getUser().then((value) =>
        {user = User(userId: value!.userId, jokeDone: value.jokeDone)});
    number = await checkStory();
  }

  //check what story is not vote
  Future<int> checkStory() async {
    notDoneJoke = [];
    await getUser().then((value) {
      //check if have data
      if (value!.jokeDone != null) {
        //make a list what story is not vote
        for (int i = 0; i < jokeStory.length; i++) {
          int temp = 0;
          for (int j = 0; j < value.jokeDone!.length; j++) {
            if (value.jokeDone![j] == jokeStory[i].id.toString()) {
              temp++;
            }
          }
          if (temp == 0) {
            notDoneJoke.add(jokeStory[i].id!);
          }
        }
      } else {
        //make a list what story is not vote
        jokeStory.forEach((element) {
          notDoneJoke.add(element.id!);
        });
      }
    });
    //random story
    if (notDoneJoke.length != 0)
      return notDoneJoke[_random.nextInt(notDoneJoke.length)] - 1;
    else
      return -1;
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * (1 - 0.08 - 0.23),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: 
            //show story
            Text(
              jokeStory.length != 0 && notDoneJoke.length != 0 && number >= 0
                  ? "${jokeStory[number].jokeText}"
                  : "\"That's all the jokes for today! Come back another day!\"",
              style: AppStyle.txtInterRegular18Silver,
            ),
          ),
          Spacer(),
          //show 2 button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(
                onTap: () {
                  setState(() {
                    //save story is voted
                    user.jokeDone!.add(jokeStory[number].id.toString());
                    UserPreferences().saveUser(user);
                    _initData();
                  });
                },
                color: ColorConstant.blue,
                text: "This is Funny!",
              ),
              Button(
                onTap: () {
                  setState(() {
                    //save story is voted
                    user.jokeDone!.add(jokeStory[number].id.toString());
                    UserPreferences().saveUser(user);
                    _initData();
                  });
                },
                color: ColorConstant.green,
                text: "This is not Funny!",
              ),
            ],
          ),
          SizedBox(
            height: 90,
          )
        ]),
      ),
    );
  }
}
