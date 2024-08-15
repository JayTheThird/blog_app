import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/error/server_exceptions.dart';
import 'package:blog_app/features/auth/data/datasource/auth_supabase_datasource.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepoImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signinWithEmailAndPassword(
        username: username,
        email: email,
        password: password,
      );

      return Right(userId);
    } on ServerExceptions catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }
}
