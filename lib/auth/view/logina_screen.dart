
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  final AuthBloc authBloc;

  const LoginForm({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: authBloc,
      builder: (context, state) {
        if (state is AuthStateAuthenticated) {
          // User is logged in, show home screen
          return Container();
        }

        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Логин'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите логин';
                  } else if (!isValidUsername(value)) {
                    return 'Неверный формат логина';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  } else if (!isValidPassword(value)) {
                    return 'Неверный формат пароля';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: state is AuthStateLoading ? null : () {
                  if (_formKey.currentState!.validate()) {
                    authBloc.add(LoginEvent(_usernameController.text, _passwordController.text));
                  }
                },
                child: Text('Войти'),
              ),
              if (state is AuthStateError) Text(state.error),
            ],
          ),
        );
      },
    );
  }
}