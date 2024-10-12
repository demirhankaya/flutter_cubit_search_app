import 'package:go_router/go_router.dart';

import '/core/core.dart';
import '/search/search.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: AppRoutePath.search.page,
  routes: [
    GoRoute(
      path: AppRoutePath.search.page,
      name: AppRoutePath.search.name,
      builder: (context, state) => const SearchPage(),
    ),
  ],
);
