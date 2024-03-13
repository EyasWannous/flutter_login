import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/cubit/password_visibility_cubit.dart';
import 'package:flutter_login/login/login.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return BlocBuilder<PasswordVisibilityCubit, PasswordVisibilityState>(
          builder: (_, __) {
            return TextField(
              key: const Key('loginForm_passwordInput_textField'),
              onChanged: (password) =>
                  context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText:
                  context.read<PasswordVisibilityCubit>().isPasswordNotVisible,
              decoration: InputDecoration(
                labelText: 'password',
                errorText: state.password.displayError != null
                    ? 'invalid password'
                    : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    context.read<PasswordVisibilityCubit>().isPasswordNotVisible
                        ? Icons.visibility_off
                        : Icons.remove_red_eye_outlined,
                  ),
                  onPressed: () => context
                      .read<PasswordVisibilityCubit>()
                      .changeVisibility(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
