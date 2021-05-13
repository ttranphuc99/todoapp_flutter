import 'package:flutter/material.dart';
import 'package:todo_app/src/const/app_title.dart';
import 'package:todo_app/src/screens/list_todo_scr.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  num _selectedMode = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(CONST_TITLE[_selectedMode])),
        body: ListTodo(mode: _selectedMode),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox),
              label: 'All',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox),
              label: 'Done',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox),
              label: 'Undone',
            ),
          ],
          currentIndex: _selectedMode,
          selectedItemColor: Colors.blue,
          onTap: _onMenuChange,
        ),
      ),
    );
  }

  void _onMenuChange(newIndex) {
    setState(() {
      _selectedMode = newIndex;
    });
  }
}