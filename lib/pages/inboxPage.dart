import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:flutter_todo/states/todoState.dart';

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
                new ListTile(title: new Text(todoList[index].task)),
          );
        },
        converter: (store) => store.state.todoState.todoList,
      ),
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
}
