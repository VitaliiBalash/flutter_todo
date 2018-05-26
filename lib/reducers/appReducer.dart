import 'package:flutter_todo/reducers/todoReducer.dart';
import 'package:flutter_todo/states/addState.dart';

AppState appReducer(AppState oldState, dynamic action) {
  return oldState.cloneWith(
    todoState: todoReducer(oldState.todoState, action),
  );
}
