import 'package:flutter/material.dart';
import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/store.dart';

class MainPage extends StatelessWidget {
  final String _title;
  final Widget _body;
  final bool _showFAB;

  MainPage(this._title, this._body, this._showFAB);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_title),
      ),
      body: _body,
      floatingActionButton: _floatingActionButton(),
      drawer: _drawer(context),
    );
  }

  Widget _floatingActionButton() => _showFAB
      ? new FloatingActionButton(
          onPressed: () => store.dispatch(new ToDoActionCreate("Task")),
          child: new Icon(Icons.add),
        )
      : null;

  Widget _drawer(BuildContext context) => new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Text("ToDo"),
              decoration: new BoxDecoration(color: Colors.blue),
            ),
            new ListTile(
              title: new Text("Inbox"),
              onTap: () =>
                  Navigator.popAndPushNamed(context, ToDoAppRoutes.inbox),
            ),
            new ListTile(
              title: new Text("Completed"),
              onTap: () =>
                  Navigator.popAndPushNamed(context, ToDoAppRoutes.completed),
            ),
          ],
        ),
      );
}
