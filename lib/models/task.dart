class Task{
  int id;
  final String name;
  bool isDone;

  Task({this.id, this.name, this.isDone});


  void toggleDone(){
    isDone = !isDone;
  }
}