import 'package:fluter_sqlite_sample/model/user.dart';
import 'package:fluter_sqlite_sample/ui/home.dart';
import 'package:fluter_sqlite_sample/util/db_helper.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DBHelper();

  // Adding a new user
  // int savedUser = await db.insertUser(User('Anna', 'Anna@456'));

  // getting the users count
  int usersCount = await db.usersLenght();
  print('Users count: $usersCount');

  // Updating a user
/*   int updateAnna = await db.updateUser(User.fromMap({
    'name': 'Anna paula carvalho',
    'password': 'annapc@456',
    'id': 0,
  })); */

  // getting a user
/*   User anna = await db.getUserById(2);
  print('User found: ${anna.toMap()}'); */

  // Deleting a user from database
  int userDeleted = await db.deleteUserById(4);
  print('User deleted: $userDeleted');
  print('Users count: $usersCount');

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQLite'),
          centerTitle: true,
          backgroundColor: Colors.black38,
        ),
        body: Home(),
      ),
    );
  }
}
