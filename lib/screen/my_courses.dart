import 'package:flutter/material.dart';
import 'package:hello_world/screen/course_detail.dart';

List<Widget> course(BuildContext context) {
  List<String> course = [
    "Communicative English (E1)",
    "Research Metodology (ZC)",
    "Emerging Technology (-)",
    "Special Topics in GD (A)",
    "Mobile & Network Forensics (A)",
    "IoT Implementation (A)",
    "Special Topics in NCS (A)"
  ];
  List<Widget> temp = [];
  // List<Widget> kp = [];
  for (var i = 0; i < course.length; i++) {
    Widget w = Container(
        margin: const EdgeInsets.all(10),
        width: 300,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseDetail(course[i])));
            },
            child: Text(course[i])));
    temp.add(w);
  }
  return temp;
}

class MyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyCourses'),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/myphoto.jpg"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              Text(
                  style: TextStyle(fontWeight: FontWeight.bold),
                  "Hendy Ardhana"),
              Text("160420138"),
              Text("Teknik Informatika"),
              Text("Gasal 2023-2024"),
              Column(
                children: course(context),
              ),
            ],
          ),
        )));
  }
}
