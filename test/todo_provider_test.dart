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
      final sharedPreferences = MockSharedPreference();

      String storedData = '[{\"id\":1,\"title\":\"todo no.1\",\"isDone\":false,\"createdTime\":\"2021-05-13T10:56:33.579Z\"}]';

      when(sharedPreferences.getString('LIST_TODO'))
      .thenAnswer((realInvocation) => storedData);

      final TodoProvider provider = TodoProvider();
      TodoProvider.sharedPreferences = sharedPreferences;
      expect((await provider.getAll()).length, 1);
    });

    test('return a list of default todo', () async {
      final sharedPreferences = MockSharedPreference();

      when(sharedPreferences.getString('LIST_TODO'))
      .thenAnswer((realInvocation) => null);

      final TodoProvider provider = TodoProvider();
      TodoProvider.sharedPreferences = sharedPreferences;
      expect((await provider.getAll()).length, generateDefaultTodoList().length);
    });

    test('able to store data in shared preference', () async {
      final sharedPreferences = MockSharedPreference();

      var todo = new Todo(1, 'Todo no.1', true, DateTime.now());
      var listTodo = [todo];
      
      var listJson = listTodo.map((todo) => todo.toJSON()).toList();

      when(sharedPreferences.setString('LIST_TODO', json.encode(listJson)))
      .thenAnswer((realInvocation) => Future<bool>.value(true));

      final TodoProvider provider = TodoProvider();
      TodoProvider.sharedPreferences = sharedPreferences;
      TodoProvider.listTodo = listTodo;
      expect((await provider.saveAll()), true);
    });

    test('able to update data in shared preference', () async {
      final sharedPreferences = MockSharedPreference();

      var todo = new Todo(1, 'Todo no.1', true, DateTime.now());
      var listTodo = [todo];

      final TodoProvider provider = TodoProvider();
      TodoProvider.sharedPreferences = sharedPreferences;
      TodoProvider.listTodo = listTodo;

      todo.isDone = false;

      var listJson = listTodo.map((todo) => todo.toJSON()).toList();

      when(sharedPreferences.setString('LIST_TODO', json.encode(listJson)))
      .thenAnswer((realInvocation) => Future<bool>.value(true));

      expect((await provider.update(todo)).isDone, false);
    });
  });
}