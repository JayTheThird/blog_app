import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<User, UserSignUpParam> {
  final AuthRepository authRepository;

  const UserSignup(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParam params) async {
    return await authRepository.signUpWithEmailAndPassword(
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

// created a class all three param will pass on Usecase generic
class UserSignUpParam {
  final String username;
  final String email;
  final String password;

  const UserSignUpParam({
    required this.username,
    required this.email,
    required this.password,
  });
}
