import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/blocs/todo_bloc.dart';
import 'package:todo_app/src/widget/todo_widget.dart';

class ListTodo extends StatefulWidget {
  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  TodoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = TodoBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 48, vertical: 32),
          child: Scaffold(
            body:  Column(
              children: [
                _buildTitle(),
                StreamBuilder(
                  stream: _bloc.listTodoStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.isEmpty) {
                        return Text('Not found any todo.');
                      }
                      var listTodo = snapshot.data;

                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: listTodo.length,
                          itemBuilder: (listViewContext, index) {
                            return TodoWidget().buildElement(listTodo[index], handleChange);
                          },
                        )
                      );
                    }
                    _bloc.loadListTodo(0);
                    return Text('Loading');
                  },
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildTitle() {
    return Text(
      'All Todo',
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    );
  }

  void handleChange() {}
}
