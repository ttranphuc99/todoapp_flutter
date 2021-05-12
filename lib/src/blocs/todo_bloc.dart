import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/repositories/todo_repository.dart';

class TodoBloc {
  // context of the UI to call snackbar
  final BuildContext _context;
  // repository instance
  TodoRepository _repository = TodoRepository();
  // publish subject
  PublishSubject<List<Todo>> _listTodoPublic = PublishSubject<List<Todo>>();
  // stream of publish subject to get new data
  Stream<List<Todo>> get listTodoStream => _listTodoPublic.stream;
  // to hold the state of list to do
  List<Todo> _listTodoData;

  /*
   * Function to close publish subject
   */
  void close() {
    _listTodoPublic.close();
  }

  /*
   * This function is to get list todo and put into the strean to UI
   * Mode is number from 0 -> 2
   * mode 0: get all done and undone todo
   * mode 1: get done todo
   * mode 2: get undone todo
   */
  List<Todo> loadListTodo(num mode) {
    try {
      _listTodoData = _repository.getAll();

      switch (mode) {
        case 1: {
          _listTodoData = _listTodoData.where((todo) => todo.isDone).toList();
          break;
        }
        case 2: {
          _listTodoData = _listTodoData.where((todo) => !todo.isDone).toList();
          break;
        }
      }

      _listTodoPublic.sink.add(_listTodoData);
    } catch (e) {

    }
    return null;
  }

  /*
   * This function is to change status of a todo
   */
  Todo changeStatus(editedTodo) {
    try {
      return _repository.update(editedTodo);
    } catch (e) {

    }
    return null;
  }
}