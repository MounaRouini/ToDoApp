//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/models/task_data.dart';
//POPUP WIDGET FOR EDITING THE TASKS

class Edit extends StatelessWidget {
  String titleinput = '';
  String name;
  int index;
  Edit(this.name, this.index);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18.0))),
      title: Text("Edit The Task",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff815ac0),
              fontSize: 24,
              fontWeight: FontWeight.w600)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onChanged: (val) {
              titleinput = val;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff815ac0)),
                ),
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff815ac0))),
                labelStyle: const TextStyle(color: Color(0xff815ac0)),
                hintText: name,
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffe4c1f9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false).editTask(
                        Provider.of<TaskData>(context, listen: false)
                            .tasks[index],
                        titleinput);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffe4c1f9)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
