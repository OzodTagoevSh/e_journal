import 'package:e_journal/student/student.dart';
import 'package:e_journal/student/student_info.dart';
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
            rightHandSideColumnWidth: 608,
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
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(right: 30.0, bottom: 60.0),
        ),

        Container(
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.remove),
          ),
          alignment: Alignment.bottomRight,
          margin: EdgeInsets.only(right: 30.0, bottom: 20.0),
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
      _getTitleItemWidget('First Name', 100,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Last Name', 100,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Student ID', 100,Colors.red),
      Container(width: 2,height: 56,color: Colors.white,),
      _getTitleItemWidget('Email', 200,Colors.red),
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
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            fixedSize: MaterialStateProperty.all(const Size(100, 56)),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentInfo(
                firstName: user.userInfo[index].firstName,
                lastName: user.userInfo[index].lastName,
                studentId: user.userInfo[index].studentId,
                email: user.userInfo[index].email,
                major: user.userInfo[index].major)));
          },
          child: Text(user.userInfo[index].firstName,style: const TextStyle(fontSize: 15, color: Colors.black),),
        ),
        Container(width: 2,height: 56,color: Colors.blueGrey,),
        Container(
          child: Text(user.userInfo[index].lastName,style: const TextStyle(fontSize: 18),),
          width: 100,
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
          width: 200,
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

