import 'package:flutter/cupertino.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "first one"),
    /*Task(name: "other one"),
    Task(name: "hiiiiiiii"),
    Task(name: "hellllloooo"),
    Task(name: "iiiiiiiiiiiiiiiiiiiiiii"),
    Task(name: "byeeeeeeeeeeeeeeeeee"),
    Task(name: "byeeeeeeeeeeeeeeeeee")*/
  ];
  void add(String taskname) {
    tasks.add(Task(name: taskname));
    notifyListeners();
  }

  void doneTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void editTask(Task task, String newname) {
    task.name = newname;
    notifyListeners();
  }
}
