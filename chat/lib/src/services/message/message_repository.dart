import 'package:chat/src/models/message_model.dart';
import 'package:chat/src/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class MessageRepository {
  Future<Either<Failure, Unit>> send({required Message message});
  Either<Failure, Message> messages({required User user});
}
