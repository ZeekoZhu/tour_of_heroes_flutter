import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@singleton
class MessagesService extends ChangeNotifier {
  final _messages = <String>[];
  UnmodifiableListView get messages => UnmodifiableListView(_messages);

  add(String message) {
    _messages.add(message);
    notifyListeners();
  }

  clear() {
    _messages.clear();
    notifyListeners();
  }
}
