// import model
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/const/default_todo_lst.dart';
import 'package:todo_app/src/models/todo.dart';

class TodoProvider {
  // static data
  static List<Todo> listTodo;

  // shared preference
  static SharedPreferences sharedPreferences;

  /*
   * Function to get all todo in storage 
   * order by created time descending 
   */
  Future<List<Todo>> getAll() async {
    if (sharedPreferences == null) {
      print('in null');
      sharedPreferences = await SharedPreferences.getInstance();
    }
    // get saved data as string
    var storedData = sharedPreferences.getString('LIST_TODO');
    
    if (storedData == null) {
      listTodo = generateDefaultTodoList();
      var result = await saveAll();
      print('result of store default data ' + result.toString());
    } else {
      // decode string into a list
      var savedData = json.decode(storedData);
      // decode string in List to Todo OBJ
      listTodo = savedData.map<Todo>((todoJson) => Todo.fromJSON(todoJson)).toList();
    }

    // sort list by desc created time
    listTodo.sort((todo1, todo2) => todo2.createdTime.compareTo(todo1.createdTime));
    return listTodo;
  }

  /*
   * Function to save todo list to shared reference
   */
  Future<bool> saveAll() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    // convert List<Todo> to List<JSON>
    var listJson = listTodo.map((todo) => todo.toJSON()).toList();
    // saved data to shared preference
    var result = await sharedPreferences.setString('LIST_TODO', json.encode(listJson));
    return result;
  }

  /*
   * Function to update a todo in storage
   */
  Future<Todo> update(Todo editedTodo) async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
    // get instance of todo in the list that need updating
    Todo currTodo = listTodo.firstWhere((todo) => todo.id == editedTodo.id);

    if (currTodo != null) {
      // asign new value to current todo
      currTodo.title = editedTodo.title;
      currTodo.isDone = editedTodo.isDone;
    }

    // save data
    var result = await saveAll();
    // saved fail, return null
    if (!result) return null;

    // return updated todo obj
    return currTodo;
  }
}