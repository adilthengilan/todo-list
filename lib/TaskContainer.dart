// import 'package:design/functions.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'TaskModel.dart';

// final taskname = TextEditingController();
// final count = TextEditingController();
// final completed = TextEditingController();

// List<String> tasks = [];
// // List<String> counts = [];
// // List<String> completes = [];

// Future<dynamic> ShowDialogue(BuildContext context) {
//   return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Add Task',
//           ),
//           content: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   TextFormField(
//                     controller: taskname,
//                     decoration: InputDecoration(hintText: 'Enter Task Name'),
//                   ),
//                   TextFormField(
//                     controller: count,
//                     decoration: InputDecoration(hintText: 'no.of Tasks'),
//                   ),
//                   TextFormField(
//                     decoration: InputDecoration(hintText: 'Completed'),
//                     controller: completed,
//                   )
//                 ],
//                 mainAxisSize: MainAxisSize.max,
//               ),
//             );
//           }),
//           actions: [
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Cancel')),
//             ElevatedButton(
//                 onPressed: () {
//                   // TaskModel obj = TaskModel(
//                   //   title: taskname.text,
//                   //   subtititle: completed.text,
//                   //   count: count.text,
//                   // );
//                   // AddTask(obj);

//                   // _saveTasks();
//                   // _savecount();
//                   _addTask(tasks);

//                   Navigator.of(context).pop();
//                 },
//                 child: Text('add'))
//           ],
//         );
//       });
// }




// Future<void> _savecount() async {
//   List<String> counts = [count.text];

//   final prefs = await SharedPreferences.getInstance();
//   prefs.setStringList('tasks', counts);
// }

// Future<void> _savecomplete() async {
//   List<String> completes = [count.text];

//   final prefs = await SharedPreferences.getInstance();
//   prefs.setStringList('tasks', completes);
// }
