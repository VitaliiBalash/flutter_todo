import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:flutter_todo/states/todoState.dart';
import 'package:flutter_todo/store.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Inbox"),
      ),
      body: new StoreConnector<AppState, List<ToDo>>(
          builder: (context, todoList) {
        return new ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildListItem(todoList[index]),
        );
      }, converter: (store) {
        return store.state.todoState.todoList
            .where((todo) => !todo.completed)
            .toList();
      }),
      floatingActionButton: new StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          final id = store.state.todoState.todoList.length;
          return () => store.dispatch(new ToDoActionCreate("Task $id"));
        },
        builder: (context, callback) => new FloatingActionButton(
              onPressed: callback,
              child: new Icon(Icons.add),
            ),
      ),
    );
  }

  Widget _buildListItem(ToDo todo) => new Dismissible(
      key: key,
      child: new ListTile(title: new Text(todo.task)),
      background: new Container(
        color: Colors.green,
        alignment: new Alignment(-1.0, 0.0),
        padding: const EdgeInsets.only(left: 16.0),
        child: new Icon(Icons.done, color: Colors.white),
      ),
      secondaryBackground: new Container(
        color: Colors.red,
        alignment: new Alignment(1.0, 0.0),
        padding: const EdgeInsets.only(right: 16.0),
        child: new Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.startToEnd:
            store.dispatch(new ToDoActionComplete(todo.id));
            break;
          case DismissDirection.endToStart:
            store.dispatch(new ToDoActionDelete(todo.id));
            break;
          default:
        }
      });
}
