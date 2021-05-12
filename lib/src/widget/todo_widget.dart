import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoWidget {
  Widget buildElement(Todo todo, handleChange) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // Title of todo
                Text(todo.title),
                // Content
                Text(todo.content)
              ],
            ),
          ),
          Checkbox(
            value: todo.isDone,
            onChanged: (bool value) {
              handleChange(value);
            }
          )
        ],
      ),
    );
  }
}
