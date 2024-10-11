enum AppRoutePath {
  Search('/search'),
  Profile('/profile');

  const AppRoutePath(this.path);
  final String path;

  String get name => path.replaceFirst('/', '');
}
