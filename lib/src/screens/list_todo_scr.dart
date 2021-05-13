import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/blocs/todo_bloc.dart';
import 'package:todo_app/src/const/app_title.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/widget/todo_widget.dart';

class ListTodo extends StatefulWidget {
  // variable hold the mode of the screen
  final num mode;

  // constructor for this screen
  const ListTodo({Key key, this.mode}) : super(key: key);

  @override
  _ListTodoState createState() => _ListTodoState();
}

class _ListTodoState extends State<ListTodo> {
  TodoBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = TodoBloc(context);
    _bloc.loadListTodo(widget.mode);
  }

  @override
  void didUpdateWidget(covariant ListTodo oldWidget) {
    super.didUpdateWidget(oldWidget);
    _bloc.loadListTodo(widget.mode);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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

                      return Expanded(
                        child: ListView.builder(
                          itemCount: listTodo.length,
                          itemBuilder: (listViewContext, index) {
                            return TodoWidget().buildElement(listTodo[index], handleChangeIsDone);
                          },
                        )
                      );
                    }
                    
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
      CONST_TITLE[widget.mode],
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
    );
  }

  void handleChangeIsDone(Todo editedTodo) {
    _bloc.changeStatus(editedTodo);
    _bloc.loadListTodo(widget.mode);
  }
}
