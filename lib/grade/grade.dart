import 'package:flutter/material.dart';

class Grade extends StatefulWidget {

  final String subject;

  Grade({required this.subject});

  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grades from ${widget.subject}'),
        centerTitle: true,
        titleSpacing: 3,
        backgroundColor: Colors.red,
      ),
    );
  }
}
