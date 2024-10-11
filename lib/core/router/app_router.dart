import 'package:flutter_cubit_search_app/features/profile/view/profile_view.dart';
import 'package:flutter_cubit_search_app/features/search/view/search_view.dart';

import '/core/core.dart';
import 'package:go_router/go_router.dart';

final AppRouter = GoRouter(
  initialLocation: AppRoutePath.Search.path,
  routes: [
    GoRoute(
      path: AppRoutePath.Search.path,
      name: AppRoutePath.Search.name,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: AppRoutePath.Profile.path,
      name: AppRoutePath.Profile.name,
      builder: (context, state) => const ProfileView(),
    ),
  ],
);
