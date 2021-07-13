import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_journal/pages/home.dart';
import 'package:e_journal/pages/remove_student.dart';
import 'package:e_journal/pages/retrieve_student.dart';
import 'package:e_journal/student/student.dart';
import 'package:e_journal/student/student_info.dart';
import 'package:e_journal/pages/add_student.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class StudentTable extends StatefulWidget {
  const StudentTable({Key? key}) : super(key: key);

  @override
  _StudentTableState createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  static const int sortName = 0;
  bool isAscending = true;
  int sortType = sortName;
  Student user = Student();

  @override
  void initState() {
    user.initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.green,
        title: const Text("Students Table"),
        centerTitle: true,
      ),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Stack(
      children: [
        Container(
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 60,
            rightHandSideColumnWidth: 748,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: user.userInfo.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          ),
          height: MediaQuery
              .of(context)
              .size
              .height,
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent()));
            },
            child: const Text('C'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 30.0, bottom: 130.0),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RetrieveStudent()));
            },
            child: const Text('R'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 30.0, bottom: 90.0),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RemoveStudent()));
            },
            child: const Text('U'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 30.0, bottom: 50.0),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RemoveStudent()));
            },
            child: const Text('D'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 30.0, bottom: 10.0),
        ),
      ],
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
        ),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          user.sortName(isAscending);
          setState(() {

          });
        },
        child: _getTitleItemWidget('№' + (sortType == sortName ? (isAscending ? '  ↓' : '  ↑') : ''),
            60,Colors.pink),
      ),
      _getTitleItemWidget('First Name', 120,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Last Name', 120,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Student ID', 100,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Email', 300,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Major', 100,Colors.red),
    ];
  }

  Widget _getTitleItemWidget(String label, double width,color) {
    return Container(
      color: color,
      child: Text(label, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white)),
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: Colors.blueGrey,
      child: Text(
        user.userInfo[index].order.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      width: 40,
      height: 56,
      //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(user.userInfo[index].firstName,style: const TextStyle(fontSize: 18),),
          width: 120,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].lastName,style: const TextStyle(fontSize: 18),),
          width: 120,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].studentId,style: const TextStyle(fontSize: 18),),
          width: 100,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),

        Container(
          child: Text(user.userInfo[index].email,style: const TextStyle(fontSize: 18),),
          width: 300,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),

        Container(
          child: Text(user.userInfo[index].major,style: const TextStyle(fontSize: 18),),
          width: 100,
          height: 56,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
        ),

      ],
    );
  }
}

