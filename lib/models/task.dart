import 'package:flutter/foundation.dart';

class Task {
  String name;
  bool isDone;
  Task({required this.name, this.isDone = false});

  void doneChange() {
    isDone = !isDone;
  }
}
