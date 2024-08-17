import 'package:blog_app/core/error/server_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signinWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> signinWithEmailAndPassword({
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

      return response.user!.id;
    } on Exception catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }
}
