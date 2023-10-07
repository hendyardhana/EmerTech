import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionObj {
  String image;
  String narration;
  String option_a;
  String option_b;
  String option_c;
  String option_d;
  String answer;

  QuestionObj(this.image, this.narration, this.option_a, this.option_b,
      this.option_c, this.option_d, this.answer);
}

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<QuestionObj> _questions = [];
  int _question_no = 0;
  int _point = 0;
  int _question_count = 0;

  late Timer _timer;
  int _hitung = 10;
  int _initValue = 0;

  Future<int> high_score() async {
    final prefs = await SharedPreferences.getInstance();
    int highest_score = prefs.getInt("highestscore") ?? 0;
    return highest_score;
  }

  @override
  void initState() {
    super.initState();
    _questions.add(QuestionObj(
        "https://image.api.playstation.com/vulcan/ap/rnd/202303/2318/ca9f73eaff9ea919bd155d160796afacd98f8e5954c80a4b.png",
        "Not a member of Avenger ",
        'Ironman',
        'Spiderman',
        'Thor',
        'Hulk Hogan',
        'Hulk Hogan'));
    _questions.add(QuestionObj(
        "https://i.pinimg.com/originals/95/81/ba/9581baf6f5d6c81700301cc3bd909dd0.jpg",
        "Not a member of Teletubbies",
        'Dipsy',
        'Patrick',
        'Laalaa',
        'Poo',
        'Patrick'));
    _questions.add(QuestionObj(
        "https://pyramidinternational.com/cdn/shop/products/WDC95972.jpg?v=1656468998",
        "Not a member of justice league",
        'batman',
        'superman',
        'flash',
        'aquades',
        'aquades'));
    _questions.add(QuestionObj(
        "https://4kwallpapers.com/images/wallpapers/the-matrix-resurrections-keanu-reeves-carrie-anne-moss-1024x1024-6967.jpg",
        "The code in The Matrix comes from what food recipes?",
        'Sushi',
        'Dumplings',
        'Stir-fry',
        'Pad thai',
        'Sushi'));
    _questions.add(QuestionObj(
        "https://www.theoriginalunderground.com/cdn/shop/products/rocky-horror-picture-show-film-poster-print-191559_1024x.jpg?v=1656593648",
        "What's the name of Meatloaf's character in The Rocky Horror Picture Show?",
        'Henry',
        'Eddie',
        'Chuck',
        'Al',
        'Eddie'));
    _questions.add(QuestionObj(
        "https://down-id.img.susercontent.com/file/56f40b096c7d9dc10d6e5132e4c546d3",
        "Who actually drew the sketch of Rose in Titanic?",
        'Leonardo DiCaprio',
        'Billy Zane',
        'James Cameron',
        'Kathy Bates',
        'James Cameron'));
    _questions.add(QuestionObj(
        "https://cdn.wallpapersafari.com/82/31/oS1OnC.jpg",
        "Who voices Joy in Pixar's Inside Out?",
        'Tina Fey',
        'Kathryn Hahn',
        'Ellen DeGeneres',
        'Amy Poehler',
        'Amy Poehler'));
    _questions.add(QuestionObj(
        "https://assets-prd.ignimgs.com/2022/05/16/lotrfellowship-1652740286087.jpg",
        "Where were The Lord of the Rings movies filmed?",
        'Ireland',
        'Iceland',
        'New Zealand',
        'Australia',
        'New Zealand'));
    _questions.add(QuestionObj(
        "https://cconnect.s3.amazonaws.com/wp-content/uploads/2019/03/Funko-Pop-Forrest-Gump-1200-thumb-1024x1024.jpg",
        "Which country does Forrest Gump travel to as part of the All-American Ping-Pong Team?",
        'Vietnam',
        'China',
        'Sweden',
        'France',
        'China'));
    _questions.add(QuestionObj(
        "https://www.theoriginalunderground.com/cdn/shop/products/pulp-fiction-film-poster-print-281196_1024x.jpg?v=1661524235",
        "Which famous Pulp Fiction scene was filmed backward?",
        "Vincent and Mia's dance scene",
        "Mia's overdose scene",
        'The “royale with cheese” scene',
        'The Ezekiel 25:17 scene',
        "Mia's overdose scene"));
    _questions.add(QuestionObj(
        "https://i.pinimg.com/originals/0d/e7/88/0de78890db3efb18131c8ef7b906eb84.jpg",
        "Which actor was in the following movies: The Outsiders, Wayne's World and Tommy Boy?",
        'Tom Cruise',
        'Matt Dillon',
        'Rob Lowe',
        'C. Thomas Howell',
        'Rob Lowe'));
    _questions.add(QuestionObj(
        "https://www.iwoman.tv/village/wp-content/uploads/2022/02/shutterstock_editorial_5852349a_huge1-1024x1024.jpg",
        "Who was the first Black person to win an Oscar?",
        'Hattie McDaniel',
        'Sidney Poitier',
        'Dorothy Dandridge',
        'James Earl Jones',
        'Hattie McDaniel'));
    _questions.add(QuestionObj(
        "https://cdn.wallpapersafari.com/67/43/Bu1Hvf.jpg",
        "What is the name of the fictional land where Frozen takes place?",
        'Arendelle',
        'Naples',
        'Florin',
        'Grimm',
        'Arendelle'));

    _questions.shuffle();
    // _questions.skip(5).take(5);
    _initValue = _hitung;
    startTimer();
    // _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    _hitung = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        // Text(_hitung.toString(),
        //     style: const TextStyle(
        //       fontSize: 24,
        //     )),
        // Text(formatTime(_hitung),
        //     style: const TextStyle(
        //       fontSize: 24,
        //     )),
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 20.0,
          percent: 1 - (_hitung / _initValue),
          center: Text(formatTime(_hitung)),
          progressColor: Colors.red,
        ),
        Text("Question No: ${_question_no + 1}",
            style: const TextStyle(
              fontSize: 24,
            )),
        // LinearPercentIndicator(
        //   center: Text(formatTime(_hitung)),
        //   width: MediaQuery.of(context).size.width,
        //   lineHeight: 20.0,
        //   percent: 1 - (_hitung / _initValue),
        //   backgroundColor: Colors.grey,
        //   progressColor: Colors.red,
        // ),
        Container(
            height: 200, child: Image.network(_questions[_question_no].image)),
        Text(_questions[_question_no].narration),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_a);
            },
            child: Text("A. " + _questions[_question_no].option_a)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_b);
            },
            child: Text("B. " + _questions[_question_no].option_b)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_c);
            },
            child: Text("C. " + _questions[_question_no].option_c)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_d);
            },
            child: Text("D. " + _questions[_question_no].option_d)),

        // ElevatedButton(
        //     onPressed: () {
        //       setState(() {
        //         _timer.isActive ? _timer.cancel() : startTimer();
        //       });
        //     },
        //     child: Text(_timer.isActive ? "Stop" : "Start"))
      ])),
    );
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_hitung > 0) {
          _hitung--;
        } else {
          // _question_no++;
          // if (_question_no > _questions.length - 1) _question_no = 0;
          // _hitung = _initValue;
          finishQuiz();
        }

        // _hitung++;
        // if (_hitung == 0) {
        //   _timer.cancel();
        //   showDialog<String>(
        //       context: context,
        //       builder: (BuildContext context) => AlertDialog(
        //             title: Text('Quiz'),
        //             content: Text('Quiz Ended'),
        //             actions: <Widget>[
        //               TextButton(
        //                 onPressed: () => Navigator.pop(context, 'OK'),
        //                 child: const Text('OK'),
        //               ),
        //             ],
        //           ));
        // } else {
        //   _hitung--;
        // }
      });
    });
  }

  String formatTime(int hitung) {
    var hours = (hitung ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((hitung % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  void checkAnswer(String answer) {
    setState(() {
      if (answer == _questions[_question_no].answer) {
        _point += 100;
      }

      _question_no++;
      _question_count++;

      if (_question_count > 4) {
        finishQuiz();
        _question_count = 0;
      } else {
        _hitung = _initValue;
      }

      // if (_question_no > _questions.length - 1) {
      //   doneQuiz();
      //   _questions.shuffle();
      //   _question_no = 0;
      // }
    });
  }

  finishQuiz() {
    _timer.cancel();
    int highest_score = 0;
    high_score().then((int result) async {
      highest_score = result;
      if (_point >= highest_score) {
        highest_score = _point;
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt("highestscore", highest_score);
      }
    });
    showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Quiz'),
              content:
                  Text('Your point = $_point \n Highest Score: $highest_score'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.pop(context, 'OK');
                //     startTimer();
                //   },
                //   child: const Text('Continue'),
                // ),
              ],
            ));
  }

  // doneQuiz() {
  //   _timer.cancel();
  //   showDialog<String>(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) => AlertDialog(
  //             title: Text('You Have Finished All Questions'),
  //             content: Text('Your point = $_point'),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context, 'OK');
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Text('Exit'),
  //               ),
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context, 'OK');
  //                   _point = 0;
  //                   _question_count = 0;
  //                   startTimer();
  //                 },
  //                 child: const Text('Start Over (Your points will be reset)'),
  //               ),
  //             ],
  //           ));
  // }
}
