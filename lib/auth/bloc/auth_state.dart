part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateAuthenticated extends AuthState {
  final String token;

  const AuthStateAuthenticated({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthStateError extends AuthState {
  final String error;

  const AuthStateError({required this.error});

  @override
  List<Object> get props => [error];
}


