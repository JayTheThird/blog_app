import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;

  AuthBloc({
    required UserSignup userSignup,
    required UserLogin userLogin,
  })  : _userSignup = userSignup,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthSignup>(_onAuthSignup);
    on<AuthLogin>(_onAuthLogin);
  }

  void _onAuthSignup(AuthSignup event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignup(
      UserSignUpParam(
        username: event.username,
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.error)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParam(
        email: event.email,
        password: event.password,
      ),
    );

    res.fold(
      (failure) => emit(AuthFailure(failure.error)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
