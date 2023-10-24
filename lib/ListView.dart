import 'package:design/providerrr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// List<String> completes = [];

// ignore: non_constant_identifier_names
Future<dynamic> ShowDialogue(
  BuildContext context,
) async =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              title: Text(
                'Add Task',
              ),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Consumer<ProviderSetting>(
                    builder: (context, datas, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        TextField(
                          controller: datas.taskname,
                          decoration:
                              InputDecoration(hintText: 'Enter Your Task Here'),
                        ),
                      ],
                    ),
                  );
                });
              }),
              actions: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromRGBO(138, 50, 203, 1))),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel')),
                    ),
                    Consumer<ProviderSetting>(builder: (context, data, child) {
                      return Container(
                        margin: EdgeInsets.only(left: 85),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(138, 50, 203, 1))),
                            onPressed: () {
                              if (data.taskname.text.isNotEmpty) {
                                data.addTask(data.taskname.text);
                                Navigator.of(context).pop();
                                print('ddd');
                              }
                            },
                            child: Text('   Add   ')),
                      );
                    })
                  ],
                )
              ]);
        });

class Listing extends StatefulWidget {
  const Listing({super.key});

  @override
  State<Listing> createState() => ListingState();
}

class ListingState extends State<Listing> {
  @override
  // void initState() {
  //   super.initState();
  //   loadTask();
  //   WidgetsFlutterBinding.ensureInitialized();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSetting>(builder: (context, data, child) {
      return ListView.builder(
          itemCount: data.tasks.length,
          itemBuilder: (context, index) {
            return Consumer<ProviderSetting>(builder: (context, data, child) {
              return GestureDetector(
                onLongPress: () {
                  data.removeTask(index);
                },
                child: ListTile(
                  title: Text(data.tasks[index]),
                  // subtitle: onPressed
                  //     ? Text('Not Completed')
                  //     : Row(
                  //         children: [Text('Completed'), Icon(Icons.done)],
                  //       ),
                  subtitle: Text('0 Completed'),
                  trailing: Container(
                    height: 30,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(43, 210, 171, 0.75))),
                      child: Icon(Icons.done),
                    ),
                  ),
                  leading: MyIcons(),
                ),
              );
            });
          });

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
    });
  }
}

class MyIcons extends StatefulWidget {
  const MyIcons({super.key});

  @override
  State<MyIcons> createState() => _MyIconsState();
}

class _MyIconsState extends State<MyIcons> {
  int i = 0;
  int currentIndex = 0;
  List<String> currentImage = [
    'assets/images/fa_paint-brush.png',
    'assets/images/fa6-solid_pen.png',
    'assets/images/fluent_desktop-flow-24-filled.png',
    'assets/images/icons8-windows-10-personalization-50 1.png'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ChangeImage();
      },
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(43, 210, 171, 0.75),
              image: DecorationImage(
                  image: AssetImage(currentImage[currentIndex])),
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }

  void ChangeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % currentImage.length;
    });
  }
}

// Future<dynamic> ShowDialogues(BuildContext context, index) async => showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//           backgroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15))),
//           title: Text(
//             'Add ${tasks[index]} Tasks',
//           ),
//           content: StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//             return SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: taskname1,
//                     decoration:
//                         InputDecoration(hintText: 'Enter Your Task Here'),
//                   ),
//                   SizedBox(
//                     height: 100,
//                     width: 200,
//                     child: dialoges(),
//                   )
//                 ],
//               ),
//             );
//           }),
//           actions: [
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(left: 15),
//                   child: ElevatedButton(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)))),
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromRGBO(138, 50, 203, 1))),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('Cancel')),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 85),
//                   child: ElevatedButton(
//                       style: ButtonStyle(
//                           shape: MaterialStatePropertyAll(
//                               RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(10)))),
//                           backgroundColor: MaterialStatePropertyAll(
//                               Color.fromRGBO(138, 50, 203, 1))),
//                       onPressed: () {
//                         addTasks(taskname1.text);
//                       },
//                       child: Text('   Add   ')),
//                 ),
//               ],
//             )
//           ]);
//     });
// addTasks(taskn) {
//   if (taskss != null) {
//     taskss.add(taskn);
//     taskname1.clear();
//   }
// }

// class dialoges extends StatefulWidget {
//   const dialoges({super.key});

//   @override
//   State<dialoges> createState() => _dialogesState();
// }

// class _dialogesState extends State<dialoges> {
//   @override
//   void initState() {
//     super.initState();
//     setState(() {});
//   }

//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: taskss.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onLongPress: () {},
//             onTap: () {},
//             child: ListTile(
//               title: Text(taskss[index]),
//               subtitle: Text('$taskcompleted completed'),
//               trailing: Container(
//                 height: 22,
//                 width: 22,
//                 color: const Color.fromARGB(255, 157, 241, 160),
//                 child: Container(
//                   margin: EdgeInsets.only(left: 7, top: 3),
//                   child: Text('$numberoftasks'),
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }

