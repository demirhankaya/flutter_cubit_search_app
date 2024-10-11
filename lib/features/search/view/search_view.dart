import 'package:flutter/material.dart';
import 'package:flutter_cubit_search_app/core/extensions/l10n_x.dart';
import 'package:flutter_cubit_search_app/shared/models/user_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.title),
      ),
      body: _SearchBody(),
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
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: context.translate.user_name,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: size.height * 0.7,
            child: ListView.builder(
              itemCount: UserModel.mockUsers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        '${context.translate.user}: ${UserModel.mockUsers[index].isim} ${UserModel.mockUsers[index].soyad}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
