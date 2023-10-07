import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final int imageNumber;
  StudentDetail(this.imageNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Student Detail $imageNumber'),
        ),
      ),
      body: Center(
          child: Image(
              image:
                  NetworkImage("https://i.pravatar.cc/300?img=$imageNumber"))),
    );
  }
}
