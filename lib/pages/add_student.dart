import 'package:e_journal/pages/student_table.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddStudent extends StatefulWidget {

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _studentId = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _major = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                child: TextFormField(
                  controller: _firstName,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'First Name', icon: Icon(Icons.person_outline)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First Name should not be empty';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                child: TextFormField(
                  controller: _lastName,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Last Name', icon: Icon(Icons.person)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last Name should not be empty';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                child: TextFormField(
                  controller: _studentId,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Student ID', icon: Icon(Icons.credit_card)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Student ID should not be empty';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                child: TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Email', icon: Icon(Icons.email)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = RegExp(pattern.toString());
                      if (!regex.hasMatch(value)) {
                        return 'Please make sure to enter valid email address';
                      }
                      return null;
                    }
                  },
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
            child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey[200],
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 20.0),
                child: TextFormField(
                  controller: _major,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Major', icon: Icon(Icons.school)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Major should not be empty';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),

          const Divider(height: 30,),
          Center(
            child: ElevatedButton(
            onPressed: () async {
              await addStudent();
              Navigator.pop(context, MaterialPageRoute(builder: (context) => const StudentTable()));
            },
            child: const Text('Add student'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green,)
            ),
          ))
        ],
      ),
    );
  }

  Future addStudent() async {
    CollectionReference students = FirebaseFirestore.instance.collection('students');
    return students
        .add({
          'firstName': _firstName.text,
          'lastName': _lastName.text,
          'studentId': _studentId.text,
          'email': _email.text,
          'major': _major.text,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
