import 'package:flutter/material.dart';
import 'TaskModel.dart';

ValueNotifier<List<TaskModel>> TaskListNotifier = ValueNotifier([]);

// void AddTask(TaskModel value) {
//   TaskListNotifier.value.add(value);
//   // print(value.toString());
//   TaskListNotifier.notifyListeners();
// }



// Future<void> loadcount() async {
//   final pref = await SharedPreferences.getInstance();
//   final saved = pref.getStringList('counts');

//   if (saved != null) {
//     counts = saved;
//     print(counts);
//   }
// }

// Future<void> loadcomplete() async {
//   final pref = await SharedPreferences.getInstance();
//   final saved = pref.getStringList('completes');

//   if (saved != null) {
//     completes = saved;
//     print(completes);
//   }
// }
