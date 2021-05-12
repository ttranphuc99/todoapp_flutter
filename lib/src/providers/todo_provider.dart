// import model
import 'package:todo_app/src/const/default_todo_lst.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoProvider {
  // static data
  static List<Todo> listTodo;

  // constructor
  TodoProvider() {
    if (listTodo == null) {
      // initialize listTodo
      listTodo = generateDefaultTodoList();
    }
  }

  /*
   * Function to get all todo in storage 
   * order by created time descending 
   */
  List<Todo> getAll() {
    listTodo.sort((todo1, todo2) => todo2.createdTime.compareTo(todo1.createdTime));
    return listTodo;
  }

  /*
   * Function to update a todo in storage
   */
  Todo update(Todo editedTodo) {
    // get instance of todo in the list that need updating
    Todo currTodo = listTodo.firstWhere((todo) => todo.id == editedTodo.id);

    if (currTodo != null) {
      // asign new value to current todo
      currTodo.title = editedTodo.title;
      currTodo.content = editedTodo.content;
      currTodo.isDone = editedTodo.isDone;
    }

    // return updated todo obj
    return currTodo;
  }
}