import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  String? _id;
  String? get id => _id;

  final String username;
  final String pictureUrl;
  bool active;
  DateTime lastSeen;

  User({
    required this.username,
    required this.pictureUrl,
    required this.active,
    required this.lastSeen,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'picture url': pictureUrl,
      'active': active,
      'last seen': lastSeen,
    };
  }

  factory User.fromJson({
    required Map<String, dynamic> json,
    required String? id,
  }) {
    final User user = User(
      username: json['username'] as String,
      pictureUrl: json['pictureUrl'] as String,
      active: json['active'] as bool,
      lastSeen: (json['lastSeen'] as Timestamp).toDate(),
    );
    id != null ? user._id = id : null;

    return user;
  }

  @override
  List<Object?> get props => [
        _id,
        username,
        pictureUrl,
        active,
        lastSeen,
      ];
}
