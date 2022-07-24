import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/screens/add_screen.dart';
import 'package:todo_app/widgets/edit.dart';

class ToDoTask extends StatelessWidget {
  void next(BuildContext c) {
    Navigator.of(c).push(
      MaterialPageRoute(builder: ((context) {
        return AddScreen();
      })),
    );
  }

  bool isdone = false;
  String taskname;
  Function(bool?) Checkboxcheck;
  void Function() delete;
  int index;

  ToDoTask(
      this.taskname, this.isdone, this.Checkboxcheck, this.delete, this.index);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      tileColor: Color(0xfff8f7ff),
      title: Text(taskname),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            checkColor: Colors.white,
            activeColor: Color(0xff815ac0),
            value: isdone,
            onChanged: Checkboxcheck,
          ), // icon-1
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => Edit(taskname, index),
              );
            },
          ),

          IconButton(icon: Icon(Icons.delete), onPressed: delete), // icon-2
        ],
      ),
    );
  }
}
