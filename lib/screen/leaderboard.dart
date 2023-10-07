import 'package:flutter/material.dart';

class Score {
  String name;
  int score;

  Score(this.name, this.score);
}

Widget scores(){
  Widget w = Container
}

// ignore: must_be_immutable
class Leaderboard extends StatelessWidget {
  Leaderboard();
  final List<String> scores = [
    Score("Player 1", 500),
    Score("Player 2", 400),
    Score("Player 3", 300),
    Score("Player 4", 200),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Leaderboard'),
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Center(
                child: ListView.builder(
          itemCount: scores.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => widRecipes(context, index)),
        const Divider(
          height: 100,
        ))
              ],
            )
        ));
  }
}