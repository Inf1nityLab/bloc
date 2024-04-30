import 'package:bloc/bloc.dart';
import 'package:bloc_practise_app/auth/data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthStateInitial()) {
    on<LoginEvent>((event, emit) async {
      final username = event.username;
      final password = event.password;

      if (username.isEmpty || password.isEmpty) {
        emit(const AuthStateError( error: 'email can not be empty'));
        return; // Остановите обработку события
      } else if (!isValidUsername(username)) {
        emit(const AuthStateError( error: ''));
        return; // Остановите обработку события
      } else if (!isValidPassword(password)) {
        emit(const AuthStateError( error: ''));
        return; // Остановите обработку события
      }

      emit(AuthStateLoading());
      try {
        final authResponse = await _authRepository.login(username, password);
        emit(AuthStateAuthenticated(token: authResponse.token));
      } catch (error) {
        emit(const AuthStateError( error: ''));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthStateLoading());
      await _authRepository.logout();
      emit(AuthStateInitial()); // Смена на AuthStateUnauthenticated в зависимости от вашей реализации
    });
  }
}

bool isValidUsername(String username) {
  // Реализуйте проверку логина
  return username.length >= 6 && username.contains('@'); // Пример проверки
}

bool isValidPassword(String password) {
  // Реализуйте проверку пароля
  return password.length >= 8 && password.contains(RegExp('[a-z]')) && password.contains(RegExp('[0-9]')); // Пример проверки
}
