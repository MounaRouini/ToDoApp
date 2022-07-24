import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newtask;
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Text("Add New Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff815ac0),
                  fontSize: 24,
                  fontWeight: FontWeight.w600)),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff815ac0)),
                ),
                disabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff815ac0))),
                labelStyle: const TextStyle(color: Color(0xff815ac0)),
                hintText: "New Task",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            onChanged: (text) => newtask = text,
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
                    Provider.of<TaskData>(context, listen: false).add(newtask!);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Add",
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
          )
        ],
      ),
    );
  }
}
