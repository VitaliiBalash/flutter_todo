import 'dart:core';

class ToDoActionComplete {
  final int id;

  ToDoActionComplete(this.id);
}

class ToDoActionDelete {
  final int id;

  ToDoActionDelete(this.id);
}

class ToDoActionCreate {
  final String task;

  ToDoActionCreate(this.task);
}
