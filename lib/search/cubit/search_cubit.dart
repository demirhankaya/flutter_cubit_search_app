import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/data.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  ///
  SearchCubit() : super(const SearchState());

  ///
  void searchUser(String name) {
    try {
      emit(
        state.copyWith(
          status: SearchStatus.loading,
        ),
      );
      final users = User.mockUsers
          .where((element) =>
              element.name!.toUpperCase().contains(name.toUpperCase()))
          .toList();

      ///
      users.isEmpty
          ? emit(
              state.copyWith(
                status: SearchStatus.empty,
              ),
            )
          : emit(
              state.copyWith(
                status: SearchStatus.success,
                users: users,
              ),
            );

      ///
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchStatus.failure,
        ),
      );
    }
  }
}
