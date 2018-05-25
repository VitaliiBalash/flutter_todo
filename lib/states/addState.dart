import 'dart:core';

import 'package:flutter_todo/states/todoState.dart';

class AppState {
  final ToDoState todoState;

  AppState({ToDoState todoState})
      : this.todoState = todoState ?? new ToDoState();

  AppState cloneWith({ToDoState todoState}) {
    return AppState(
      todoState: todoState ?? this.todoState,
    );
  }
}
