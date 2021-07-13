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
      body: _gradeTable(context),
    );
  }

  Widget _gradeTable(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Full Name')),
            DataColumn(label: Text('Homework 1')),
            DataColumn(label: Text('Quiz 1')),
            DataColumn(label: Text('Homework 2')),
            DataColumn(label: Text('Midterm')),
            DataColumn(label: Text('Homework 3')),
            DataColumn(label: Text('Quiz 2')),
            DataColumn(label: Text('Homework 4')),
            DataColumn(label: Text('Quiz 3')),
            DataColumn(label: Text('Project')),
            DataColumn(label: Text('Final')),
            DataColumn(label: Text('Overall')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Ozod Tagoev')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
              DataCell(Text('50')),
            ]),

          ],
        ),
      ),
    );
  }
}
