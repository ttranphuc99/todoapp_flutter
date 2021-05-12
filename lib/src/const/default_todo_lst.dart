import 'package:todo_app/src/models/todo.dart';

List<Todo> generateDefaultTodoList() {
  List<Todo> listTodo = [];

  // initialize toDo obj
  Todo newTodo;
  newTodo = new Todo(
      1,
      'Todo no. 1',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      2,
      'Todo no. 2',
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      3,
      'Todo no. 3',
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      4,
      'Todo no. 4',
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  // initialize toDo obj
  newTodo = new Todo(
      5,
      'Todo no. 5',
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo',
      false,
      DateTime.now());
  // add toDo obj into list
  listTodo.add(newTodo);

  return listTodo;
}
