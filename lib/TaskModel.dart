
class TaskModel {
  final String title;
  final String subtititle;
  final String count;
  // final String image;

  TaskModel({
    required this.title,
    required this.subtititle,
    required this.count,
    // required this.image,
  });
}

class finalVariable {
  late String taskname;

  List<String> tasks = [];
  finalVariable({required this.taskname, required this.tasks});
}
