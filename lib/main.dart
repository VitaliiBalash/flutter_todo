import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import "package:flutter_todo/pages/inboxPage.dart";
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:flutter_todo/store.dart';

void main() {
  runApp(new ReduxApp());
}

class ReduxApp extends StatelessWidget {
  ReduxApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: "ToDo",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          ToDoAppRoutes.inbox: (context) {
            return new InboxPage();
          },
        },
      ),
    );
  }
}
