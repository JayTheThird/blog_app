import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/error/server_exceptions.dart';
import 'package:blog_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

class AuthRepoImplementation implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepoImplementation(this.remoteDataSource);

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() function,
  ) async {
    try {
      final user = await function();

      return Right(user);
    } on sb.AuthException catch (e) {
      return Left(Failure(e.message));
    } on ServerExceptions catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signinWithEmailAndPassword(
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }
}
