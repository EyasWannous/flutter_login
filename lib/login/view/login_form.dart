import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/login/cubit/password_visibility_cubit.dart';
import 'package:flutter_login/login/login.dart';
import 'package:flutter_login/login/widgets/widgets.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            BlocProvider(
              create: (context) => PasswordVisibilityCubit(),
              child: const PasswordInput(),
            ),
            const Padding(padding: EdgeInsets.all(12)),
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}
