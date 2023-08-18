import 'package:chat/core/error/failures.dart';
import 'package:chat/src/models/user_model.dart';
import 'package:chat/src/services/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore _firestore;
  UserRepositoryImpl(this._firestore);

  @override
  Future<Either<Failure, User>> connect({required User user}) async {
    try {
      String? id;
      var data = user.toJson();
      if (user.id == null) {
        id = await _firestore
            .collection('users')
            .add(data)
            .then((value) => value.id);
      } else {
        await _firestore.collection('users').doc(user.id).update({
          'active': true,
        });
      }
      final userReturned = User.fromJson(json: data, id: id);

      return Right(userReturned);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, List<User>>> fetchOnlineUsers() async {
    try {
      final List<User> users = await _firestore
          .collection('users')
          .where('active', isEqualTo: true)
          .get()
          .then(
            (usersData) => usersData.docs
                .map(
                  (user) => User.fromJson(
                    json: user.data(),
                    id: user.id,
                  ),
                )
                .toList(),
          );

      return Right(users);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.code));
    }
  }

  @override
  Future<Either<Failure, Unit>> disconnect({required User user}) async {
    try {
      await _firestore.collection('users').doc(user.id).update({
        'active': false,
        'last seen': Timestamp.fromDate(DateTime.now()),
      });
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.code));
    }
  }
}
