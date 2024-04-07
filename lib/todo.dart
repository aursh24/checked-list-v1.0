import 'package:ecomm/Util/dilog_box.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app/navbar.dart';

void main() {
  runApp(const MaterialApp(
    home: Todo(),
    debugShowCheckedModeBanner: false,
  ));
}

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  //text controller
  final _controller = TextEditingController();

  // list of to-do tasks
  List<List<dynamic>> toDoList = [
    ["Read 'Wings of Fire'", false],
    ["Drink Water", false],
  ];

  // checkbox tapped/untapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !(toDoList[index][1] as bool);
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    if (index >= 0 && index < toDoList.length) {
      setState(() {
        toDoList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 242, 122),
      //drawer: NavBar(),
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30.0,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/236x/91/fd/59/91fd59f75785ef797b65ff69dbf002e6.jpg"),
            ),
          )
        ],
        backgroundColor: Color.fromARGB(255, 238, 219, 8),
        centerTitle: true,
        title: const Text(
          'c̶h̶e̶c̶k̶e̶d̶  List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 235, 235, 51),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0].toString(),
            taskCompleted: toDoList[index][1] as bool,
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              // Checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // Task Name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),  
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
