import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUsers extends UsersEvent {
  final bool isInitialFetch;
  final String search;

  FetchUsers({this.isInitialFetch = false, this.search = ''});

  @override
  List<Object?> get props => [isInitialFetch, search];
}
