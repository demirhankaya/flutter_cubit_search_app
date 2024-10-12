import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/core.dart';
import '/data/data.dart';
import '/search/search.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      appBar: AppBar(),

      ///
      body: const _SearchBody(),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody();

  @override
  Widget build(BuildContext context) {
    ///
    final read = context.read<SearchCubit>();

    ///
    return Column(
      children: [
        /// [Arama Çubuğu]
        SearchBarWidget(
          ///
          onChanged: (String name) {
            /// [SearchText değerini Değiştir]
            read.searchUser(name);
          },

          ///
          hintText: context.translate.user_name,
        ),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              /// Switch expressions
              return switch (state.status) {
                ///
                SearchStatus.empty => const Center(
                    child: Text(
                      'Kullanıcı yok!',
                    ),
                  ),
                SearchStatus.loading =>
                  const CircularProgressIndicator.adaptive(),

                ///
                SearchStatus.success => _UserListTile(
                    users: state.users,
                  ),

                ///
                SearchStatus.failure => const Center(
                    child: Text(
                      'Hata!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
              };
            },
          ),
        ),
      ],
    );
  }
}

class _UserListTile extends StatelessWidget {
  ///
  final List<User> users;

  ///
  const _UserListTile({required this.users});

  @override
  Widget build(BuildContext context) {
    ///
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        ///
        return Card(
          child: ListTile(
            title: Text(
              '${context.translate.user}: ${users[index].name} ${users[index].surname}',
            ),
          ),
        );
      },
    );
  }
}
