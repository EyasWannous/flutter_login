import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  PasswordVisibilityCubit() : super(PasswordVisibilityOff());

  bool isPasswordNotVisible = true;

  changeVisibility() {
    emit(
      isPasswordNotVisible ? PasswordVisibilityOn() : PasswordVisibilityOff(),
    );
    isPasswordNotVisible = !isPasswordNotVisible;
  }
}
