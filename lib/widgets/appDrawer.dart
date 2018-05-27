import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:flutter_todo/states/todoState.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new StoreConnector<AppState, ToDoState>(
        converter: (store) => store.state.todoState,
        builder: (_, todoState) => new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new Text("ToDo"),
                  decoration: new BoxDecoration(color: Colors.blue),
                ),
                new ListTile(
                  title: new Text("Inbox"),
                  leading: new Icon(Icons.inbox),
                  trailing: new Text(
                    todoState.todoList
                        .where((todo) => !todo.completed)
                        .length
                        .toString(),
                  ),
                  onTap: () => _openInboxPage(context),
                ),
                new ListTile(
                  title: new Text("Completed"),
                  leading: new Icon(Icons.archive),
                  trailing: new Text(
                    todoState.todoList
                        .where((todo) => todo.completed)
                        .length
                        .toString(),
                  ),
                  onTap: () => _openCompletedPage(context),
                ),
              ],
            ),
      ),
    );
  }

  _openInboxPage(BuildContext context) =>
      Navigator.popAndPushNamed(context, ToDoAppRoutes.inbox);

  _openCompletedPage(BuildContext context) =>
      Navigator.popAndPushNamed(context, ToDoAppRoutes.completed);
}
