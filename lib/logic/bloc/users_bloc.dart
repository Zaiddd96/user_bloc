import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/user_model.dart';
import 'users_event.dart';
import 'users_state.dart';
import '../../../data/repositories/user_repository.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository userRepository;
  int skip = 0;
  final int limit = 10;
  bool isFetching = false;
  String currentSearch = '';

  UsersBloc(this.userRepository) : super(UsersInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UsersState> emit) async {
    if (isFetching) return;

    try {
      isFetching = true;

      if (event.isInitialFetch || event.search != currentSearch) {
        emit(UsersLoading());
        skip = 0;
        currentSearch = event.search;
      }

      final users = await userRepository.fetchUsers(
        skip: skip,
        limit: limit,
        search: currentSearch.isEmpty ? null : currentSearch,
      );

      final currentState = state;
      List<UserModel> allUsers = [];

      if (currentState is UsersLoaded && !event.isInitialFetch) {
        allUsers = List.from(currentState.users)..addAll(users);
      } else {
        allUsers = users;
      }

      emit(UsersLoaded(
        users: allUsers,
        hasReachedMax: users.length < limit,
      ));

      skip += limit;
    } catch (e) {
      emit(UsersError(message: e.toString()));
    } finally {
      isFetching = false;
    }
  }
}
