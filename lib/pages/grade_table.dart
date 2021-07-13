import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GradeTable extends StatefulWidget {
  const GradeTable({Key? key}) : super(key: key);

  @override
  _GradeTableState createState() => _GradeTableState();
}

class _GradeTableState extends State<GradeTable> {

  final TextEditingController _hw1 = TextEditingController();
  final TextEditingController _hw2 = TextEditingController();
  final TextEditingController _hw3 = TextEditingController();
  final TextEditingController _hw4 = TextEditingController();
  final TextEditingController _quiz1 = TextEditingController();
  final TextEditingController _quiz2 = TextEditingController();
  final TextEditingController _quiz3 = TextEditingController();
  final TextEditingController _midterm = TextEditingController();
  final TextEditingController _project = TextEditingController();
  final TextEditingController _final = TextEditingController();
  final TextEditingController _overall = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Hmwk 1', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Quiz 1', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Hmwk 2', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Midterm', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Hmwk 3', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Quiz 2', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Hmwk 4', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Quiz 3', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Project', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Final', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
            DataColumn(label: Text('Overall', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange, fontSize: 16.0),)),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Ozod Tagoev')),
              DataCell(_changeGrade(context, _hw1)),
              DataCell(_changeGrade(context, _quiz1)),
              DataCell(_changeGrade(context, _hw2)),
              DataCell(_changeGrade(context, _midterm)),
              DataCell(_changeGrade(context, _hw3)),
              DataCell(_changeGrade(context, _quiz2)),
              DataCell(_changeGrade(context, _hw4)),
              DataCell(_changeGrade(context, _quiz3)),
              DataCell(_changeGrade(context, _project)),
              DataCell(_changeGrade(context, _final)),
              DataCell(_changeGrade(context, _overall)),
            ]),

          ],
        ),
      ),
    );
  }
  
  Widget _changeGrade(BuildContext context, TextEditingController editingController) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: SizedBox(
        width: 70,
        child: Material(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.grey[100],
          elevation: 0.0,
          child: TextFormField(
            controller: editingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '0',
            ),
            textAlign: TextAlign.center,
            onTap: () async {
              await addGrade(editingController);
            },
          ),
        ),
      ),
    );
  }

  Future addGrade(TextEditingController editingController) async {

  }
}
