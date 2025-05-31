import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_detail_event.dart';
import 'user_detail_state.dart';
import '../../../data/repositories/user_repository.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UserRepository userRepository;

  UserDetailBloc(this.userRepository) : super(UserDetailInitial()) {
    on<FetchUserDetail>(_onFetchUserDetail);
  }

  Future<void> _onFetchUserDetail(FetchUserDetail event, Emitter<UserDetailState> emit) async {
    try {
      emit(UserDetailLoading());

      final posts = await userRepository.fetchUserPosts(event.userId);
      final todos = await userRepository.fetchUserTodos(event.userId);

      emit(UserDetailLoaded(posts: posts, todos: todos));
    } catch (e) {
      emit(UserDetailError(message: e.toString()));
    }
  }
}
