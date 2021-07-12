import 'package:flutter/material.dart';
import 'package:e_journal/student/student.dart';

class StudentInfo extends StatefulWidget {

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
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('First Name'),
            subtitle: Text(widget.firstName, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
          ),
          ListTile(
            title: const Text('Last Name'),
            subtitle: Text(
              widget.lastName,
              style: const TextStyle(
                  color: Colors.purple, fontWeight: FontWeight.w600),
            ),
          ),
          ListTile(
            title: const Text('Student ID'),
            subtitle: Text(widget.studentId, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
          ),
          ListTile(
            title: const Text('Email'),
            subtitle: Text(widget.email, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
          ),
          ListTile(
            title: const Text('Major'),
            subtitle: Text(widget.major, style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
          ),

          const Divider(height: 50, color: Colors.purple,),
          ElevatedButton(onPressed: () {},
            child: const Text('Update'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green,)
            ),
          ),
        ],
      ),
    );
  }
}

