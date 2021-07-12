import 'package:e_journal/grade/grade.dart';
import 'package:e_journal/pages/home.dart';
import 'package:e_journal/student/student.dart';
import 'package:flutter/material.dart';

class Subject extends StatefulWidget {

  final String subject;
  final Color color;
  const Subject({required this.subject, required this.color});

  @override
  State<Subject> createState() => _SubjectState();
}

class _SubjectState extends State<Subject> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Grade(subject: widget.subject)));
        },
        child: Text(widget.subject, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
        autofocus: true,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(widget.color),
          fixedSize: MaterialStateProperty.all(const Size(120.0, 100.0)),
        ),
      ),
    );
  }
}

class SubjectInfo extends StatelessWidget {
  const SubjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
        centerTitle: true,
        titleSpacing: 3,
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Icon(Icons.home),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
        child: GridView.count(crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 2.0,
          children: const [
            Subject(subject: 'Algebra', color: Colors.purple,),
            Subject(subject: 'Physics', color: Colors.red,),
            Subject(subject: 'Biology', color:  Colors.green,),
            Subject(subject: 'Mother Tongue', color: Colors.teal,),
            Subject(subject: 'History', color: Colors.pink,),
            Subject(subject: 'English', color: Colors.amber,),
            Subject(subject: 'Geometry', color: Colors.grey,),
            Subject(subject: 'Geography', color: Colors.lightGreen,),
            Subject(subject: 'Literature', color: Colors.indigo,),
            Subject(subject: 'Informatics', color: Colors.teal,),
            Subject(subject: 'Economics', color: Colors.deepOrangeAccent,),
            Subject(subject: 'Chemistry', color: Colors.pinkAccent,),
          ],
        ),
      ),

          /*Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Choose the students table or grades in order to see the students list and their grades:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
          Divider(height: 30,color: Colors.red,),
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

           */
    );
  }
}



