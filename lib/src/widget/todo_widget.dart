import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoWidget {
  Widget buildElement(Todo todo, handleChangeIsDone) {
    return ListTile(
      title: Column(
        children: [
          Row(
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
          Divider(height: 30, thickness: 3, color: Colors.teal[900]),
        ],
      ),
    );
  }

  Widget _buildTitle(Todo todo) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        todo.title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
