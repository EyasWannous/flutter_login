part of 'password_visibility_cubit.dart';

sealed class PasswordVisibilityState extends Equatable {
  const PasswordVisibilityState();

  @override
  List<Object> get props => [];
}

final class PasswordVisibilityOn extends PasswordVisibilityState {}

final class PasswordVisibilityOff extends PasswordVisibilityState {}
