import 'package:flutter/material.dart';
import 'package:flutter_todo/actions/todoActions.dart';
import 'package:flutter_todo/store.dart';

class CreateEditPage extends StatelessWidget {
  final _taskController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(context),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Widget _appBar(BuildContext context) => new AppBar(
        title: new Text("New ToDo"),
        leading: new IconButton(
          icon: new Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      );

  Widget _floatingActionButton(BuildContext context) =>
      new FloatingActionButton(
        onPressed: () {
          store.dispatch(new ToDoActionCreate(_taskController.text));
          Navigator.pop(context);
        },
        child: new Icon(Icons.save),
      );

  Widget _body() => new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              autofocus: true,
              decoration: new InputDecoration(labelText: "Task"),
              controller: _taskController,
            )
          ],
        ),
      );
}
