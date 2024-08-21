import 'package:blog_app/core/error/server_exceptions.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signinWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> signinWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          "username": username,
        },
      );

      if (response.user == null) {
        throw const ServerExceptions("User is Null!");
      }

      return UserModel.fromJson(
        response.user!.toJson(),
      );
    } on Exception catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const ServerExceptions("User is null");
      }

      return UserModel.fromJson(
        response.user!.toJson(),
      );
    } on Exception catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
