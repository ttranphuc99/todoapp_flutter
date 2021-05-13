import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/src/const/default_todo_lst.dart';
import 'package:todo_app/src/models/todo.dart';
import 'package:todo_app/src/providers/todo_provider.dart';

class MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  group('todo_provider', () {
    test('return a list of todo from shared preference', () async {
      // mock sharedpreference instance
      final sharedPreferences = MockSharedPreference();

      // default todo obj in shared preference
      String storedData =
          '[{\"id\":1,\"title\":\"todo no.1\",\"isDone\":false,\"createdTime\":\"2021-05-13T10:56:33.579Z\"}]';

      // mock shared preference to return default data in this test case
      when(sharedPreferences.getString('LIST_TODO'))
          .thenAnswer((realInvocation) => storedData);

      // init provider instance
      final TodoProvider provider = TodoProvider();

      // assign mock reference to shared reference instance
      TodoProvider.sharedPreferences = sharedPreferences;

      // compare the length of the list result
      expect((await provider.getAll()).length, 1);
    });

    test('return a list of default todo', () async {
      // mock sharedpreference instance
      final sharedPreferences = MockSharedPreference();

      // mock shared preference to return no data in this test case
      when(sharedPreferences.getString('LIST_TODO'))
          .thenAnswer((realInvocation) => null);

      // init provider instance
      final TodoProvider provider = TodoProvider();

      // assign mock reference to shared reference instance
      TodoProvider.sharedPreferences = sharedPreferences;

      // compare the length of the list result
      expect(
          (await provider.getAll()).length, generateDefaultTodoList().length);
    });

    test('able to store data in shared preference', () async {
      // mock sharedpreference instance
      final sharedPreferences = MockSharedPreference();

      // create new data of todo for this test case
      var todo = new Todo(1, 'Todo no.1', true, DateTime.now());
      var listTodo = [todo];

      // convert data to json for storing
      var listJson = listTodo.map((todo) => todo.toJSON()).toList();

      // mock shared preference to accept storing data
      when(sharedPreferences.setString('LIST_TODO', json.encode(listJson)))
          .thenAnswer((realInvocation) => Future<bool>.value(true));

      // init provider instance
      final TodoProvider provider = TodoProvider();

      // assign mock reference to shared reference instance
      TodoProvider.sharedPreferences = sharedPreferences;

      // assign list todo data
      TodoProvider.listTodo = listTodo;

      // compare result
      expect((await provider.saveAll()), true);
    });

    test('able to update data in shared preference', () async {
      // mock sharedpreference instance
      final sharedPreferences = MockSharedPreference();

      // create new data of todo for this test case
      var todo = new Todo(1, 'Todo no.1', true, DateTime.now());

      // assign mock reference to shared reference instance
      var listTodo = [todo];

      // init provider instance
      final TodoProvider provider = TodoProvider();
      TodoProvider.sharedPreferences = sharedPreferences;

      // assign list todo data
      TodoProvider.listTodo = listTodo;

      // change data of todo
      todo.isDone = false;

      // convert data to json for storing
      var listJson = listTodo.map((todo) => todo.toJSON()).toList();

      // mock shared preference to accept storing data
      when(sharedPreferences.setString('LIST_TODO', json.encode(listJson)))
          .thenAnswer((realInvocation) => Future<bool>.value(true));

      // compare result
      expect((await provider.update(todo)).isDone, false);
    });
  });
}
