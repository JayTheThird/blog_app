part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String password;

  const AuthLogin(
    this.email,
    this.password,
  );
}

final class AuthSignup extends AuthEvent {
  final String username;
  final String email;
  final String password;

  const AuthSignup({
    required this.username,
    required this.email,
    required this.password,
  });
}
