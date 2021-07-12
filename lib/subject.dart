import 'package:e_journal/student/student.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {

  final String subject;
  const Subject({required this.subject});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.2,
      child: ElevatedButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Student()));
        },
        child: Text(widget.subject),
        autofocus: true,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
          fixedSize: MaterialStateProperty.all(const Size(130.0, 40.0)),
        ),
      ),
    );
  }
}

class SubjectInfo extends StatelessWidget {
  const SubjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Subject(subject: 'Algebra'),
        Subject(subject: 'Physics'),
        Subject(subject: 'Biology'),
        Subject(subject: 'Mother Tongue'),
        Subject(subject: 'History'),
        Subject(subject: 'English'),
        Subject(subject: 'Geometry'),
        Subject(subject: 'Geography'),
        Subject(subject: 'Literature'),
        Subject(subject: 'Informatics'),
        Subject(subject: 'Economics'),
        Subject(subject: 'Chemistry'),
      ],
    );
  }
}



