import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_login/home/view/home_page.dart';
import 'package:flutter_login/login/login.dart';
import 'package:flutter_login/splash/splash.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: context.read<AuthenticationBloc>().navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                context
                    .read<AuthenticationBloc>()
                    .navigator
                    .pushAndRemoveUntil<void>(
                      HomePage.route(),
                      (_) => false,
                    );
              case AuthenticationStatus.unauthenticated:
                context
                    .read<AuthenticationBloc>()
                    .navigator
                    .pushAndRemoveUntil<void>(
                      LoginPage.route(),
                      (_) => false,
                    );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
