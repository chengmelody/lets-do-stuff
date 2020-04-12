import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final bool isChecked;
  final Function toggleCheck;
  final String itemName;
  final Function removeTask;

  ListItem({this.itemName,this.toggleCheck, this.isChecked, this.removeTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListTile(
        title: Text(
          itemName,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        onLongPress: removeTask,
        trailing: Checkbox(
            value: isChecked,
            onChanged: toggleCheck
        ),
      ),
    );
  }
}

