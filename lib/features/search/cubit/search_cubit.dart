import 'package:flutter_bloc/flutter_bloc.dart';
import '/shared/shared.dart';

class SearchCubit extends Cubit<List<UserModel>> {
  SearchCubit() : super(UserModel.mockUsers);

  void SearchUser(String Ad) {
    List<UserModel> SearchedUser = UserModel.mockUsers
        .where(
            (element) => element.isim.toUpperCase().contains(Ad.toUpperCase()))
        .toList();
    emit(SearchedUser);
  }
}
