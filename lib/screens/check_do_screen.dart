import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo-list.dart';
import 'package:todo_app/screens/add_screen.dart';

//MAIN SCREEN

class CheckDoScreen extends StatefulWidget {
  const CheckDoScreen({Key? key}) : super(key: key);

  @override
  State<CheckDoScreen> createState() => _CheckDoScreenState();
}

class _CheckDoScreenState extends State<CheckDoScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        //ADD BUTTON
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              backgroundColor: Color(0xfff8f7ff),
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddScreen())),
            );
          },
          backgroundColor: Color(0xff815ac0),
          child: Icon(
            Icons.add,
          ),
        ),
        backgroundColor: Color(0xffe4c1f9),
        body: Padding(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //CONTAINER OF THE APP NAME
            Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CheckDo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add_task,
                    color: Colors.white,
                    size: 38,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //THE LIST
            Expanded(
                child: Material(color: Color(0xffe4c1f9), child: TodoList())),
          ]),
        ),
      ),
    );
  }
}
