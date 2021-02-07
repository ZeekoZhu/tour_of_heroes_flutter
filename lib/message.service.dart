import 'package:injectable/injectable.dart';

@singleton
class MessageService {
  final _messages = <String>[];

  add(String message) {
    _messages.add(message);
  }

  clear() {
    _messages.clear();
  }
}
