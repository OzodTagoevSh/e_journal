import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGrade extends StatefulWidget {
  const AddGrade({Key? key}) : super(key: key);

  @override
  _AddGradeState createState() => _AddGradeState();
}

class _AddGradeState extends State<AddGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Grade'),
        centerTitle: true,
      ),
      body: GetUserName(),
    );
  }
}

class GetUserName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    CollectionReference users = FirebaseFirestore.instance.collection('students');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc().get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['firstName']} ${data['lastName']}");
        }

        return Text("loading");
      },
    );
  }
}