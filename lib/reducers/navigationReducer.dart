import 'package:flutter_todo/actions/navigationActions.dart';
import 'package:flutter_todo/states/navigationState.dart';

NavigationState navigationReducer(NavigationState oldState, dynamic action) {
  var newState = oldState;
  if (action is NavigationActionChangeRoute) {
    newState = oldState.cloneWith(currentRoute: action.route);
  }
  return newState;
}
