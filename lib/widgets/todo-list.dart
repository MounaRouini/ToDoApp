import 'package:flutter/material.dart';
import 'package:todo_app/models/task_data.dart';
//import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/todo_task.dart';
import 'package:provider/provider.dart';

//THE LISTVIEW OF LISTTILES

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: ((context, taskData, child) {
      return ListView.separated(
        itemCount: Provider.of<TaskData>(context).tasks.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTask(
              taskData.tasks[index].name,
              taskData.tasks[index].isDone,
              (val) => taskData.doneTask(taskData.tasks[index]),
              () => taskData.deleteTask(taskData.tasks[index]),
              index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
          );
        },
      );
    }));
  }
}
