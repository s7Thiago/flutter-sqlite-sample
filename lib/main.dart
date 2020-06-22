import 'package:fluter_sqlite_sample/ui/home.dart';
import 'package:flutter/material.dart';

main() => runApp(App());

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
