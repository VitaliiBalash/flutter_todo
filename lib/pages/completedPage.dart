import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/appState.dart';
import 'package:flutter_todo/states/todoState.dart';
import 'package:flutter_todo/store.dart';

class CompletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<ToDo>>(
      builder: (context, todoList) {
        return new ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListItem(todoList[index]),
        );
      },
      converter: (store) {
        return store.state.todoState.todoList
            .where((todo) => todo.completed)
            .toList();
      },
    );
  }

  Widget _buildListItem(ToDo todo) {
    return new Dismissible(
      key: new Key(todo.id.toString()),
      child: new ListTile(title: new Text(todo.task)),
      direction: DismissDirection.endToStart,
      background: new Container(
        color: Colors.red,
        alignment: new Alignment(1.0, 0.0),
        padding: const EdgeInsets.only(right: 16.0),
        child: new Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) => _handleDismiss(todo.id, direction),
    );
  }

  _handleDismiss(int todoId, DismissDirection direction) {
    switch (direction) {
      case DismissDirection.endToStart:
        store.dispatch(new ToDoActionDelete(todoId));
        break;
      default:
    }
  }
}
