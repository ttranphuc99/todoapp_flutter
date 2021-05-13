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

  Todo.fromJSON(Map<String, dynamic> json) :
    id = json['id'],
    title = json['title'],
    content = json['content'],
    isDone = json['isDone'],
    createdTime = DateTime.parse(json['createdTime']);

  Map<String, dynamic> toJSON() => {
    'id': id,
    'title': title,
    'content': content,
    'isDone': isDone,
    'createdTime': createdTime.toString()
  };
}