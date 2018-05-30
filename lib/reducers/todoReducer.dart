import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/todoState.dart';
import 'package:redux/redux.dart';

Reducer<ToDoState> todoReducer = combineReducers<ToDoState>([
  new TypedReducer<ToDoState, ToDoActionCreate>(_handleActionCreate),
  new TypedReducer<ToDoState, ToDoActionComplete>(_handleActionComplete),
  new TypedReducer<ToDoState, ToDoActionDelete>(_handleActionDelete),
]);

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
