import 'dart:async';

import 'package:chat/core/error/failures.dart';
import 'package:chat/src/models/message_model.dart';
import 'package:chat/src/models/user_model.dart';
import 'package:chat/src/services/message/message_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class MessageRepositoryImpl implements MessageRepository {
  final FirebaseFirestore _firestore;
  MessageRepositoryImpl(this._firestore);

  @override
  Future<Either<Failure, Unit>> send({required Message message}) {
    // TODO: implement send
    throw UnimplementedError();
  }

  @override
  Either<Failure, Message> messages({required User user}) {
    // TODO: implement messages
    throw UnimplementedError();
  }
}
