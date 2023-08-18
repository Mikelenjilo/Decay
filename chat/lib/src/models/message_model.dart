import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  late final String _id;
  String get id => _id;

  final String from;
  final String to;
  final DateTime timestamp;
  final String content;

  Message({
    required this.from,
    required this.to,
    required this.timestamp,
    required this.content,
  });

  @override
  List<Object?> get props => [
        _id,
        from,
        to,
        timestamp,
        content,
      ];

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
      'timestamp': timestamp,
      'content': content,
    };
  }

  factory Message.fromJson({
    required Map<String, dynamic> json,
    required String? id,
  }) {
    final message = Message(
      from: json['from'] as String,
      to: json['to'] as String,
      timestamp: (json['timestamp'] as Timestamp).toDate(),
      content: json['content'] as String,
    );
    id != null ? message._id = id : null;

    return message;
  }
}
