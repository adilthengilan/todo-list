import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> NumberofTasks = [];
final taskname1 = TextEditingController();
int numberoftasks = NumberofTasks.length;
int taskcompleted = 0;

List<String> NumberofTasks1 = [];
int numberoftasks1 = NumberofTasks1.length;
final taskname2 = TextEditingController();
int taskcompleted1 = 0;

Future<dynamic> ShowDialoguetask1(BuildContext context) async => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(
            'Add Task',
          ),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(height: 300, child: TodoList()),
            );
          }));
    });

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void initState() {
    super.initState();
    loadTasks();
  }

  // final TextEditingController _taskController = TextEditingController();

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      NumberofTasks = prefs.getStringList('NumberofTasks') ?? [];
    });
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('NumberofTasks', NumberofTasks);
  }

  void _addTask(String taskings) {
    setState(() {
      NumberofTasks.add(taskings);
      _saveTasks();
      taskname1.clear();
    });
  }

  void _removeTask(int index) {
    setState(() {
      NumberofTasks.removeAt(index);
      _saveTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            controller: taskname1,
            decoration: InputDecoration(labelText: 'Task'),
            onSubmitted: (taskings) {
              if (taskname1.text.isNotEmpty) {
                _addTask(taskings);
                numberoftasks++;
              }
            },
          ),
          Expanded(
            child: GestureDetector(
              onLongPress: () {
                _removeTask(0);
              },
              child: ListView.builder(
                itemCount: NumberofTasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(NumberofTasks[index]),
                    trailing: Container(
                        height: 20,
                        width: 110,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Completed'))),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

            
            // ValueListenableBuilder(
    //     valueListenable: TaskListNotifier,
    //     builder: (BuildContext context, List<TaskModel> TaskListNotifier,
    //         Widget? child) {
    //       return ListView.separated(
    //         itemBuilder: (context, index) {
    //           final data = TaskListNotifier[index];

    //           return ListTile(
    //               leading: MyIcons(),
    //               title: Text(data.title),
    //               subtitle: Text(data.subtititle),
    //               trailing: Container(
    //                 height: 20,
    //                 width: 20,
    //                 decoration: BoxDecoration(
    //                     color: Color.fromRGBO(43, 210, 171, 0.75),
    //                     border: Border.all(
    //                         color: Color.fromARGB(255, 5, 172, 116))),
    //                 child: Container(
    //                     margin: EdgeInsets.only(left: 5, top: 1),
    //                     child: Text(data.count)),
    //               ));
    //         },
    //         separatorBuilder: (BuildContext context, int index) {
    //           return const Divider();
    //         },
    //         itemCount: TaskListNotifier.length,
    //       );
    //     });
  
