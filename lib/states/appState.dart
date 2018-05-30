import 'dart:core';

import 'package:flutter_todo/states/navigationState.dart';
import 'package:flutter_todo/states/todoState.dart';

class AppState {
  final NavigationState navigationState;
  final ToDoState todoState;

  AppState({NavigationState navigationState, ToDoState todoState})
      : this.navigationState = navigationState ?? new NavigationState(),
        this.todoState = todoState ?? new ToDoState();

  AppState cloneWith({NavigationState navigationState, ToDoState todoState}) {
    return AppState(
      navigationState: navigationState ?? this.navigationState,
      todoState: todoState ?? this.todoState,
    );
  }
}
