import 'package:flutter/material.dart';
import 'package:hello_world/screen/studentDetail.dart';

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('StudentList'),
        ),
      ),
      body: Center(
        child: Column(children: [
          Center(
            child: Text("This is Student List"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(16)));
              },
              child: Text("Student 16")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(5)));
              },
              child: Text("Student 5")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(4)));
              },
              child: Text("Student 4"))
        ]),
      ),
    );
  }
}
