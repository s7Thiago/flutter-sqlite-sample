import 'package:fluter_sqlite_sample/model/user.dart';
import 'package:fluter_sqlite_sample/ui/home.dart';
import 'package:fluter_sqlite_sample/util/db_helper.dart';
import 'package:flutter/material.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DBHelper();

  // Adding a new user
  int savedUser = await db.insertUser(User('Anna', 'Anna@456'));
  print('Saved user: $savedUser');

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
