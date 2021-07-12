import 'package:e_journal/pages/student_table.dart';
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
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Choose the students table or grades in order to see the students list and their grades:',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 20.0, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(50, 100)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const StudentTable()));
              },
              child: const Text('Students Table', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(50, 100)),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                ),
                onPressed: () {

                },
                child: const Text('Grades', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),)),
          ),
        ],
      ),
    );
  }
}
