import 'package:flutter_todo/reducers/appReducer.dart';
import 'package:flutter_todo/states/addState.dart';
import 'package:redux/redux.dart';

final store = new Store<AppState>(
  appReducer,
  initialState: new AppState(),
);
