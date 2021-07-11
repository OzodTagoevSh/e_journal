import 'package:e_journal/subject.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Journal'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Choose the subject in order to see the students list and their grades:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20,),
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
      ),
    );
  }
}
