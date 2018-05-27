import 'package:flutter/material.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/widgets/appDrawer.dart';

class MainPage extends StatelessWidget {
  final String _title;
  final Widget _body;
  final bool _showFAB;

  MainPage(this._title, this._body, this._showFAB);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(_title)),
      body: _body,
      floatingActionButton: _floatingActionButton(context),
      drawer: new AppDrawer(),
    );
  }

  Widget _floatingActionButton(BuildContext context) => _showFAB
      ? new FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, ToDoAppRoutes.create),
          child: new Icon(Icons.add),
        )
      : null;
}
