import 'package:flutter_todo/reducers/navigationReducer.dart';
import 'package:flutter_todo/reducers/todoReducer.dart';
import 'package:flutter_todo/states/appState.dart';

AppState appReducer(AppState oldState, dynamic action) {
  return oldState.cloneWith(
    navigationState: navigationReducer(oldState.navigationState, action),
    todoState: todoReducer(oldState.todoState, action),
  );
}
