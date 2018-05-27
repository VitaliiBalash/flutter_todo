import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/todoState.dart';

ToDoState todoReducer(ToDoState oldState, dynamic action) {
  ToDoState newState = oldState;
  if (action is ToDoActionCreate) {
    newState = _handleActionCreate(oldState, action);
  } else if (action is ToDoActionComplete) {
    newState = _handleActionComplete(oldState, action);
  } else if (action is ToDoActionDelete) {
    newState = _handleActionDelete(oldState, action);
  }
  return newState;
}

ToDoState _handleActionCreate(ToDoState oldState, ToDoActionCreate action) {
  return oldState.cloneWith(
    todoList: oldState.todoList.toList()..add(new ToDo(action.task)),
  );
}

ToDoState _handleActionComplete(ToDoState oldState, ToDoActionComplete action) {
  final newToDoList = oldState.todoList.toList();
  final elementIndex = newToDoList.indexWhere((item) => item.id == action.id);
  newToDoList[elementIndex] =
      newToDoList[elementIndex].cloneWith(completed: true);
  return oldState.cloneWith(todoList: newToDoList);
}

ToDoState _handleActionDelete(ToDoState oldState, ToDoActionDelete action) {
  final newToDoList = oldState.todoList.toList();
  final elementIndex = newToDoList.indexWhere((item) => item.id == action.id);
  newToDoList.removeAt(elementIndex);
  return oldState.cloneWith(todoList: newToDoList);
}
