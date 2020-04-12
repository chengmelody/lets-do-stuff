import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:do_it_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskName;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow[900],
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextField(
                  style: TextStyle(color: Colors.black87),
                  enableSuggestions: true,
                  autofocus: true,
                  maxLines: null,
                  onChanged: (String userInput) {
                    //print(userInput);
                    taskName = userInput;
                  },
                ),
                SizedBox(height: 20.0),
                FlatButton(
                  color: Colors.yellow[900],
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () {
                    if(taskName != null) {
                      Provider.of<TaskData>(context, listen: false)
                          .updateTaskList(taskName);
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
