import 'package:blog_app/core/secrets/app_secrets.dart';
import 'package:blog_app/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:blog_app/features/auth/data/repository/auth_repo_implementation.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );
  serviceLocator.registerLazySingleton(
    () => supabase.client,
  );
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator<SupabaseClient>(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepoImplementation(
      serviceLocator<AuthRemoteDataSource>(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignup(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator<AuthRepository>(),
    ),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignup: serviceLocator<UserSignup>(),
      userLogin: serviceLocator<UserLogin>(),
    ),
  );
}
