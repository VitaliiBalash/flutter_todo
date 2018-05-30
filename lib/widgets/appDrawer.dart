import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/states/appState.dart';

class AppDrawer extends StatelessWidget {
  String _currentRoute = ToDoAppRoutes.inbox;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, appState) => new ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                new DrawerHeader(
                  child: new Text("ToDo"),
                  decoration: new BoxDecoration(color: Colors.blue),
                ),
                new ListTile(
                  title: new Text("Inbox"),
                  leading: new Icon(Icons.inbox),
                  trailing: new Text(_inboxItemsCount(appState)),
                  onTap: () => _openInboxPage(context),
                  selected: _isInboxPage(appState),
                ),
                new ListTile(
                  title: new Text("Completed"),
                  leading: new Icon(Icons.archive),
                  trailing: new Text(_completedItemsCount(appState)),
                  onTap: () => _openCompletedPage(context),
                  selected: _isCompletedPage(appState),
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

  bool _isInboxPage(AppState appState) =>
      appState.navigationState.currentRoute == ToDoAppRoutes.inbox;

  bool _isCompletedPage(AppState appState) =>
      appState.navigationState.currentRoute == ToDoAppRoutes.completed;

  String _inboxItemsCount(AppState appState) => appState.todoState.todoList
      .where((todo) => !todo.completed)
      .length
      .toString();

  String _completedItemsCount(AppState appState) => appState.todoState.todoList
      .where((todo) => todo.completed)
      .length
      .toString();
}
