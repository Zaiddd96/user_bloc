import 'package:equatable/equatable.dart';

class UserDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUserDetail extends UserDetailEvent {
  final int userId;

  FetchUserDetail({required this.userId});

  @override
  List<Object?> get props => [userId];
}
