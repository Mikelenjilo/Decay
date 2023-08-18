import 'package:chat/src/services/user/user_repository.dart';
import 'package:chat/src/services/user/user_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void init() {
  // User Repository
  getIt
      .registerLazySingleton<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Firebase
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}
