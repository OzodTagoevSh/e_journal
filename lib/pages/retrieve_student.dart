import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveStudent extends StatefulWidget {
  const RetrieveStudent({Key? key}) : super(key: key);

  @override
  _RetrieveStudentState createState() => _RetrieveStudentState();
}

class _RetrieveStudentState extends State<RetrieveStudent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students in Database'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: _home(context),
    );
  }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('students').snapshots();
  Widget _home(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Column(
              children: [
                ListTile(
                  title: const Text('First Name'),
                  subtitle: Text(data['firstName'], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
                ),
                ListTile(
                  title: const Text('Last Name'),
                  subtitle: Text(data['lastName'], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
                ),
                ListTile(
                  title: const Text('Student ID'),
                  subtitle: Text(data['studentId'], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(data['email'], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
                ),
                ListTile(
                  title: const Text('Major'),
                  subtitle: Text(data['major'], style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w600),),
                ),
                const Divider(height: 30, color: Colors.teal,),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}