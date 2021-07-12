import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_journal/pages/student_table.dart';
import 'package:flutter/material.dart';

class RemoveStudent extends StatefulWidget {
  const RemoveStudent({Key? key}) : super(key: key);

  @override
  _RemoveStudentState createState() => _RemoveStudentState();
}

class _RemoveStudentState extends State<RemoveStudent> {

  TextEditingController _firstName = TextEditingController();
  TextEditingController _studentId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Student'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 8.0),
            child: Text('Please enter the student\'s first name and id in order to remove that student:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 100.0, 14.0, 8.0),
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

          const SizedBox(height: 80,),

          Center(
            child: ElevatedButton(
            onPressed: () async {
              await removeStudent();
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const StudentTable()));
            },
            child: const Text('Remove student'),
            style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(Colors.green,)
            ),
          ))
        ],
      ),
    );
  }

  Future removeStudent() async {
    CollectionReference students = FirebaseFirestore.instance.collection('students');
    return students
        .where('firstName', isEqualTo : _firstName.text)
        .where('studentId', isEqualTo: _studentId.text)
        .get().then((value) {
        value.docs.forEach((element) {
        FirebaseFirestore.instance.collection('students').doc(element.id).delete().then((value) {
          print("Success!");
        });
      });
    });
  }
}
