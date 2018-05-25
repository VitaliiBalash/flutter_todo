import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import "package:flutter_todo/pages/inboxPage.dart";
import 'package:flutter_todo/reducers/appReducer.dart';
import 'package:flutter_todo/routes.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(new ReduxApp());
}

class ReduxApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
  );

  ReduxApp();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: "ToDo",
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          ToDoAppRoutes.inbox: (context) {
            return new StoreBuilder<AppState>(
//              onInit: (store) => store.dispatch(new LoadTodosAction()),
              builder: (context, store) {
                return new InboxPage();
              },
            );
          },
        },
      ),
    );
  }
}
