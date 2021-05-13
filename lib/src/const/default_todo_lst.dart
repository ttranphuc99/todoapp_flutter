import 'package:todo_app/src/models/todo.dart';

List<Todo> generateDefaultTodoList() {
  List<Todo> listTodo = [];

  // initialize toDo obj
  Todo newTodo;
  newTodo = new Todo(
      1,
      'Todo no. 1',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      2,
      'Todo no. 2',
      true,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      3,
      'Todo no. 3',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      4,
      'Todo no. 4',
      true,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      5,
      'Todo no. 5',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  return listTodo;
}
