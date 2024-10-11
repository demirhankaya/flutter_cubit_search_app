import 'package:flutter/material.dart';
import 'package:flutter_cubit_search_app/core/constants/theme.dart';
import 'package:flutter_cubit_search_app/core/router/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: AppRouter,

        /// [L10n]
        /// Delegate: Temsilci Listesi
        localizationsDelegates: AppLocalizations.localizationsDelegates,

        /// Desteklenen Diller
        supportedLocales: AppLocalizations.supportedLocales,
        title: "Search App",
        theme: MaterialTheme().dark());
  }
}
