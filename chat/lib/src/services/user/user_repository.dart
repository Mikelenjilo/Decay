import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> connect({required User user});
  Future<Either<Failure, List<User>>> fetchOnlineUsers();
  Future<Either<Failure, Unit>> disconnect({required User user});
}
