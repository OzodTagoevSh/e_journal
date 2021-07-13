
class Student {
  List<StudentInformation> _userInfo = <StudentInformation>[];
  List<Map> students = [
    {
      'firstName': 'Ozod',
      'lastName': 'Tagoev',
      'studentId': 'U1710010',
      'email': 'ozod.tagoev@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Shoxrux',
      'lastName': 'Abdunazarov',
      'studentId': 'U1710056',
      'email': 'shoxrux@gmail.com',
      'major': 'ICE'
    },
    {
      'firstName': 'Dilshod',
      'lastName': 'Sayfiyev',
      'studentId': 'U1710010',
      'email': 'dilshod@gmail.com',
      'major': 'SOL'
    },
    {
      'firstName': 'Komron',
      'lastName': 'Khodjaev',
      'studentId': 'U1710036',
      'email': 'komron.khodjaev@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Karim',
      'lastName': 'Pardaev',
      'studentId': 'U1710042',
      'email': 'karim@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Azamat',
      'lastName': 'Vahobov',
      'studentId': 'U1710265',
      'email': 'azamat.vahobov@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Enver',
      'lastName': 'Menadjiev',
      'studentId': 'U1710019',
      'email': 'enver@gmail.com',
      'major': 'ICE'
    },
    {
      'firstName': 'Rashid',
      'lastName': 'Ismoilov',
      'studentId': 'U1710058',
      'email': 'rashidshax@gmail.com',
      'major': 'ICE'
    },
    {
      'firstName': 'Khurshid',
      'lastName': 'Normurodov',
      'studentId': 'U1710055',
      'email': 'khur.uzb.normurodov@gmail.com',
      'major': 'ICE'
    },
    {
      'firstName': 'Dilshod',
      'lastName': 'Bakhtiyorov',
      'studentId': 'U1710016',
      'email': 'dilshod.bakht@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Jamshid',
      'lastName': 'Abdusodikov',
      'studentId': 'U1710017',
      'email': 'jamshid@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Javoxir',
      'lastName': 'Nazarov',
      'studentId': 'U1710001',
      'email': 'javoxir@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Elbek',
      'lastName': 'Shaykulov',
      'studentId': 'U1710040',
      'email': 'elbek@gmail.com',
      'major': 'ICE'
    },
    {
      'firstName': 'Abror',
      'lastName': 'Abduvahobov',
      'studentId': 'U1710025',
      'email': 'abror@gmail.com',
      'major': 'SOL'
    },
    {
      'firstName': 'Abdurohman',
      'lastName': 'Abullaev',
      'studentId': 'U1710022',
      'email': 'abdullaev@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Ulugbek',
      'lastName': 'Isroilov',
      'studentId': 'U1710057',
      'email': 'ulugbek@gmail.com',
      'major': 'CSE'
    },
    {
      'firstName': 'Temur',
      'lastName': 'Mannonov',
      'studentId': 'U17100266',
      'email': 'mannonov.temur@gmail.com',
      'major': 'ICE'
    }
  ];

  void initData() {
    for (int i = 0; i < students.length; i++) {
      _userInfo.add(StudentInformation(
        firstName: students[i]['firstName'],
        lastName: students[i]['lastName'],
        order: i + 1,
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
