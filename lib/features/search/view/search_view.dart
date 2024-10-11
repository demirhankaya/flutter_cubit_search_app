import 'package:flutter/material.dart';
import 'package:flutter_cubit_search_app/core/extensions/l10n_x.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _SearchBody(),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.translate.title),
    );
  }
}
