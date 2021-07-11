import 'package:flutter/material.dart';
import 'package:e_journal/student/student.dart';

class StudentInfo extends StatelessWidget {

  String firstName;
  String lastName;
  String studentId;
  String email;
  String major;

  StudentInfo({
    required this.firstName,
    required this.lastName,
    required this.studentId,
    required this.email,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('First Name'),
              subtitle: Text(firstName),
            ),
            ListTile(
              title: Text('Last Name'),
              subtitle: Text(lastName),
            ),
            ListTile(
              title: Text('Student ID'),
              subtitle: Text(studentId),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(email),
            ),
            ListTile(
              title: Text('Major'),
              subtitle: Text(major),
            ),
          ],
        ),
      ),
    );
  }
}

