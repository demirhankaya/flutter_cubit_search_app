part of 'search_cubit.dart';

enum SearchStatus { empty, loading, success, failure }

@immutable
class SearchState extends Equatable {
  ///
  const SearchState({
    /// Dummy Data olduğu için direkt success'ten başlattık.
    this.status = SearchStatus.success,
    this.users = const <User>[],
  });

  ///
  final SearchStatus status;
  final List<User> users;

  ///
  SearchState copyWith({
    SearchStatus? status,
    List<User>? users,
  }) {
    return SearchState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  ///
  @override
  List<Object?> get props => [
        status,
        users,
      ];

  ///
  @override
  bool? get stringify => true;
}
