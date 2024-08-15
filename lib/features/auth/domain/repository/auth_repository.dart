import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
