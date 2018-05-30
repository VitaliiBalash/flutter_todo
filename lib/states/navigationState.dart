class NavigationState {
  final String currentRoute;

  NavigationState({String currentRoute}) : this.currentRoute = currentRoute;

  cloneWith({String currentRoute}) {
    return NavigationState(currentRoute: currentRoute ?? this.currentRoute);
  }
}
