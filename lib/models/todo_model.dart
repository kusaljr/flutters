class Todo {
  final int? id;
  final String text;
  final int isDone;
  final int taskId;

  Todo(
      {this.id,
      required this.text,
      required this.isDone,
      required this.taskId});

  Map<String, dynamic> toMap() {
    return {'id': id, 'text': text, 'isDone': isDone, 'taskId': taskId};
  }
}
