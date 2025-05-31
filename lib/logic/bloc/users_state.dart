import 'package:equatable/equatable.dart';
import '../../../data/models/user_model.dart';

abstract class UsersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;
  final bool hasReachedMax;

  UsersLoaded({required this.users, required this.hasReachedMax});

  UsersLoaded copyWith({List<UserModel>? users, bool? hasReachedMax}) {
    return UsersLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [users, hasReachedMax];
}

class UsersError extends UsersState {
  final String message;

  UsersError({required this.message});

  @override
  List<Object?> get props => [message];
}
