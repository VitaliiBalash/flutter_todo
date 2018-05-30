import 'package:flutter_todo/reducers/appReducer.dart';
import 'package:flutter_todo/states/appState.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final store = new Store<AppState>(
  appReducer,
  initialState: new AppState(),
  middleware: [new LoggingMiddleware.printer()],
);
