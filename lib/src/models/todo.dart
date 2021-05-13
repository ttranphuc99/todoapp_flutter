class Todo {
  num id;
  String title;
  bool isDone;
  DateTime createdTime;

  Todo.newEmptyTodo();

  Todo(num _id, String _title, bool _isDone, DateTime _createdTime) :
    id = _id,
    title = _title,
    isDone = _isDone,
    createdTime = _createdTime;

  Todo.fromJSON(Map<String, dynamic> json) :
    id = json['id'],
    title = json['title'],
    isDone = json['isDone'],
    createdTime = DateTime.parse(json['createdTime']);

  Map<String, dynamic> toJSON() => {
    'id': id,
    'title': title,
    'isDone': isDone,
    'createdTime': createdTime.toString()
  };
}