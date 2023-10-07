import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CourseDetail extends StatelessWidget {
  final String name;
  // final List<String> kp;
  CourseDetail(this.name);

  @override
  Widget build(BuildContext context) {
    temp = name.split(" ");
    tempkp = temp[temp.length - 1].split("");
    kp = tempkp[1] + tempkp[2];
    for (var i = 0; i < temp.length - 1; i++) {
      String p = temp[i];
      namewithoutkp += '$p ';
    }

    if (name == "Communicative English (E1)") {
      sks = "2 sks";
    } else {
      sks = "3 sks";
    }

    if(name == "Communicative English (E1)"){
      ruangan = "TF 03.01";
      waktu = "Jumat\n15:45 - 17:35";
    } else if (name == "Research Metodology (ZC)"){
      ruangan = "TF 02.01";
      waktu = "Rabu\n09:45 - 12:30";
    } else if (name == "Emerging Technology (-)"){
      ruangan = "TB 01.01A";
      waktu = "Senin\n07:00 - 09:45";
    } else if (name == "Special Topics in GD (A)"){
      ruangan = "TB 01.01A";
      waktu = "Rabu\n07:00 - 09:45";
    } else if (name == "Mobile & Network Forensics (A)"){
      ruangan = "TG 03.04";
      waktu = "Selasa\n13:00 - 15:45";
    } else if (name == "IoT Implementation (A)"){
      ruangan = "TG 03.04";
      waktu = "Selasa\n09:45 - 12:30";
    } else {
      ruangan = "TB 03.01";
      waktu = "Kamis\n13:00 - 15:45";
    }

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(name),
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Center(
                child: Text(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    namewithoutkp)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: Card(child: Center(child: Text("KP $kp")))),
                Container(
                    width: 100,
                    height: 100,
                    child: Card(child: Center(child: Text(waktu)))),
                Container(
                    width: 100,
                    height: 100,
                    child: Card(child: Center(child: Text(ruangan)))),
                Container(
                    width: 100,
                    height: 100,
                    child: Card(child: Center(child: Text(sks)))),
              ],
            )
          ],
        )));
  }
}