import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/repositories/todo_repository.dart';
import 'package:todo_app/src/widget/my_snackbar.dart';

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

  // TodoBloc constructor
  TodoBloc(this._context);

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
  Future<List<Todo>> loadListTodo(num mode) async {
    try {
      // get lis todo
      _listTodoData = await _repository.getAll();

      // filter list todo by its status
      switch (mode) {
        // filter list done todo
        case 1: {
          _listTodoData = _listTodoData.where((todo) => todo.isDone).toList();
          break;
        }
        // filter list undone todo
        case 2: {
          _listTodoData = _listTodoData.where((todo) => !todo.isDone).toList();
          break;
        }
      }

      // put the result to stream to deliver to screen
      _listTodoPublic.sink.add(_listTodoData);
    } catch (e) {
      MySnackbar.showSnackbar(_context, 'Error');
    }
    return null;
  }

  /*
   * This function is to change status of a todo
   */
  Future<Todo> changeStatus(editedTodo) async {
    try {
      var result = await _repository.update(editedTodo);

      return result;
    } catch (e) {
      MySnackbar.showSnackbar(_context, 'Error');
    }
    return null;
  }
}