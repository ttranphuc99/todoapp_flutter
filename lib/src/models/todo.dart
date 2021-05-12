class Todo {
  num id;
  String title;
  String content;
  bool isDone;
  DateTime createdTime;

  Todo.newEmptyTodo();

  Todo(num _id, String _title, String _content, bool _isDone, DateTime _createdTime) :
    id = _id,
    title = _title,
    content = _content,
    isDone = _isDone,
    createdTime = _createdTime;
}