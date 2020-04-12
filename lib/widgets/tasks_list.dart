import 'package:flutter/material.dart';
import 'list_item.dart';
import 'package:provider/provider.dart';
import 'package:do_it_app/models/task_data.dart';

class TasksList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return ListItem(
            itemName: task.name,
            //widget.tasks[index].name,
            isChecked: task.isDone,
            //Provider.of<TaskData>(context).tasks[index].isDone,
            toggleCheck: (checkState) {
              taskData.checkTask(
                  task); //Provider.of<TaskData>(context).tasks[index].toggleDone();
            },
            removeTask: () {
              return showDialog(context: context,
              barrierDismissible: true,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text('Delete'),
                  content: Text("Would you like to delete this task?"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: (){
                        taskData.deleteTask(task);
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('No'),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
            },
          );
        },
        itemCount: taskData.tasks.length,
      );
    });
  }

}
