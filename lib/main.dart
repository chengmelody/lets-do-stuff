import 'package:flutter/material.dart';
import 'package:do_it_app/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:do_it_app/models/task_data.dart';

void main() => runApp(TaskApp());

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.yellow[900],
          textSelectionColor: Colors.yellow[900]
        ),
        home: TasksScreen(),
      ),
    );
  }
}

