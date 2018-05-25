import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/addState.dart';

AppState appReducer(AppState oldState, dynamic action) {
  if (action is ToDoActionCreate) {
    return oldState.cloneWith(
      todoState: oldState.todoState.addToDo(action.task),
    );
  }
  return oldState;
}
