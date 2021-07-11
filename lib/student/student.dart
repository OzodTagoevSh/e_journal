
class Student {
  List<StudentInformation> _userInfo = <StudentInformation>[];
  List<Map> students = [
    {
      'firstName': 'Ozod',
      'lastName': 'Tagoev',
      'email': 'ozod.tagoev@gmail.com',
      'studentId': 'U1710010',
      'major': 'CSE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'email': 'k.khodjaev@gmail.com',
      'studentId': 'U1710128',
      'major': 'ICE',
    }
  ];

  void initData() {
    for (int i = 0; i < students.length; i++) {
      _userInfo.add(StudentInformation(
        firstName: students[i]['firstName'],
        lastName: students[i]['lastName'],
        order: i+1,
        email: students[i]['email'],
        studentId: students[i]['studentId'],
        major: students[i]['major'],
      ));
    }
  }

  List<StudentInformation> get userInfo => _userInfo;

  set userInfo(List<StudentInformation> value) {
    _userInfo = value;
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    _userInfo.sort((a, b) {
      int aId = a.order;
      int bId = b.order;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    _userInfo.sort((a, b) {
      if (a.order == b.order) {
        int? aId = int.tryParse(a.firstName.replaceFirst('User_', ''));
        int? bId = int.tryParse(b.firstName .replaceFirst('User_', ''));
        return (aId! - bId!);
      } else if (a.order != b.order) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}

class StudentInformation {
  int order;
  String firstName;
  String lastName;
  String studentId;
  String email;
  String major;

  StudentInformation({
    required this.firstName,
    required this.lastName,
    required this.order,
    required this.studentId,
    required this.email,
    required this.major,
  });
}