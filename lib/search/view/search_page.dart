import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/search/search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return BlocProvider<SearchCubit>(
      ///
      create: (context) => SearchCubit(),

      ///
      child: const SearchView(),
    );
  }
}
