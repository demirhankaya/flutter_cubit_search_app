import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_search_app/core/extensions/l10n_x.dart';
import 'package:flutter_cubit_search_app/features/search/cubit/search_cubit.dart';
import 'package:flutter_cubit_search_app/shared/models/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.translate.title),
        ),
        body: _SearchBody(),
      ),
    );
  }
}

class _SearchBody extends StatelessWidget {
  const _SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SearchCubit, List<UserModel>>(
        builder: (context, users) {
          return Column(
            children: [
              BlocConsumer<SearchCubit, List<UserModel>>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: context.translate.user_name,
                    ),
                    onChanged: (value) =>
                        context.read<SearchCubit>().SearchUser(value),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: size.height * 0.7,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                            '${context.translate.user}: ${users[index].isim} ${users[index].soyad}'),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
