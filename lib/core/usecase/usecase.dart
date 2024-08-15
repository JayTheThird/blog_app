import 'package:blog_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  // interface for use case
  Future<Either<Failure, SuccessType>> call(Params params);
}
