import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/providers/todo_provider.dart';

class TodoRepository {

  // instance of provider
  TodoProvider _provider = new TodoProvider();

  /*
   * Function to get all todo in storage 
   * order by created time descending 
   */
  List<Todo> getAll () {
    return _provider.getAll();
  }

  /*
   * Function to update a todo in storage
   */
  Todo update(Todo editedTodo) {
    return _provider.update(editedTodo);
  }
}