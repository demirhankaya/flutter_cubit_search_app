enum AppRoutePath {
  search('/search');

  const AppRoutePath(this.page);
  final String page;

  String get name => page.replaceFirst('/', '');
}
