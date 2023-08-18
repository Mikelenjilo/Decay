import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String? code;

  const ServerFailure([this.code]);

  @override
  List<Object?> get props => [code];
}
