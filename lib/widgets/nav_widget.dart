import 'package:flutter/material.dart';
import 'package:do_it_app/screens/timer_screen.dart';
import 'package:do_it_app/screens/tasks_screen.dart';

class NavBar extends StatefulWidget {
  NavBar(this.index);
  int index;
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text('Tasks'),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.timer),
          title: Text('Timer'),
        ),
      ],
      currentIndex: widget.index,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.yellow[900],
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      if (index == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return TasksScreen();
        }));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return TimerScreen();
        }));
      }
    });
  }
}