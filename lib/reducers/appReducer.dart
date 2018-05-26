import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/addState.dart';

AppState appReducer(AppState oldState, dynamic action) {
  if (action is ToDoActionCreate) {
    return oldState.cloneWith(
      todoState: oldState.todoState.addToDo(action.task),
    );
  } else if (action is ToDoActionComplete) {
    final newToDoList = oldState.todoState.todoList.toList();
    final elementIndex = newToDoList.indexWhere((item) => item.id == action.id);
    newToDoList[elementIndex] =
        newToDoList[elementIndex].copyWith(completed: true);
    return oldState.cloneWith(
        todoState: oldState.todoState.copyWith(todoList: newToDoList));
  } else if (action is ToDoActionDelete) {
    final newToDoList = oldState.todoState.todoList.toList();
    final elementIndex = newToDoList.indexWhere((item) => item.id == action.id);
    newToDoList.removeAt(elementIndex);
    return oldState.cloneWith(
        todoState: oldState.todoState.copyWith(todoList: newToDoList));
  }
  return oldState;
}
