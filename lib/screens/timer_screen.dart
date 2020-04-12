import 'package:flutter/material.dart';
import 'package:do_it_app/widgets/nav_widget.dart';
import 'package:do_it_app/widgets/timer_decoration.dart';
import 'dart:async';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  void resetTimer() {
    setState(() {
      secondsPassed = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextContainer(
                      label: 'HRS', value: hours.toString().padLeft(2, '0')),
                  CustomTextContainer(
                      label: 'MIN', value: minutes.toString().padLeft(2, '0')),
                  CustomTextContainer(
                      label: 'SEC', value: seconds.toString().padLeft(2, '0')),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: isActive ? Colors.red : Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                                isActive = !isActive;
                              },
                        );},
                        minWidth: 150.0,
                        height: 42.0,
                        child: Text(
                          isActive ? 'STOP' : "START", style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ),
            ],
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 15.0, right: 8.0),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  resetTimer();
                  if (isActive) {
                    isActive = !isActive;
                  }
                });
              },
              backgroundColor: Colors.yellow[900],
              tooltip: 'RESET',
              child: Icon(Icons.restore),
            ),
          ),
          bottomNavigationBar: NavBar(1),
        ));
  }
}


