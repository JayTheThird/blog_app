import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParam> {
  final AuthRepository authRepository;

  UserLogin(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParam params) async {
    return await authRepository.logInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParam {
  final String email;
  final String password;

  const UserLoginParam({
    required this.email,
    required this.password,
  });
}
