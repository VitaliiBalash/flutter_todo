import 'dart:core';

class ToDoState {
  final List<ToDo> todoList = new List<ToDo>();
}

class ToDo {
  final int id;
  final String task;
  final bool completed;

  ToDo(this.task, {int id, bool completed})
      : this.id = id ?? _generateRandomId(),
        this.completed = completed ?? false;

  ToDo copyWith({int id, String task, bool completed}) {
    return new ToDo(
      task ?? this.task,
      id: id ?? this.id,
      completed: completed ?? this.completed,
    );
  }

  static int _generateRandomId() {
    return new DateTime.now().millisecondsSinceEpoch;
  }
}
