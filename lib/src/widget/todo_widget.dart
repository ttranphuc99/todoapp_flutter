import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoWidget {
  Widget buildElement(Todo todo, handleChangeIsDone) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 1),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  // Title of todo
                  _buildTitle(todo),
                ],
              ),
            ),
            Checkbox(
                value: todo.isDone,
                onChanged: (bool value) {
                  todo.isDone = value;
                  handleChangeIsDone(todo);
                }),
          ],
        ),
      ),
    );
  }

  // function to build title of the todo
  Widget _buildTitle(Todo todo) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        todo.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
