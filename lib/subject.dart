import 'package:e_journal/student/student.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {

  final String subject;
  const Subject({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.2,
      child: ElevatedButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Student()));
        },
        child: Text(subject),
        autofocus: true,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          fixedSize: MaterialStateProperty.all(const Size(130.0, 40.0)),
        ),
      ),
    );
  }
}


