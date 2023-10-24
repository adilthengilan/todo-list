import 'package:design/ListView.dart';
import 'package:design/LoginPage.dart';
import 'package:design/providerrr.dart';
import 'package:design/showmodalbottomsheet.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Load the saved list when the app starts
  LoginPageState login = LoginPageState();

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context);
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      // _____________________________________Container created for creating back ground gradient Color.
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 40, 32, 151),
            Color.fromARGB(255, 255, 0, 217)
          ])),
      child: Scaffold(
        // ______________________________Scaffold color is taked as transparent to continueing with the gradient Color,_______________________________
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(10, 50, 0, 0),
                          height: 80,
                          width: 200,
                          color: const Color.fromARGB(0, 255, 255, 255),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.height / 30,
                                        0,
                                        0,
                                        0),
                                    child: const Text(
                                      'Hello!',
                                      style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.height / 32,
                                        0,
                                        0,
                                        0),
                                    child: Text(
                                      username[0],
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // ______________________This Container Containing the Profile image of 'John Doe',
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width / 4.9,
                                  MediaQuery.of(context).size.height / 25,
                                  0,
                                  0),
                              height: 60,
                              width: 60,
                              // color: Colors.white,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/user pic.jpeg",
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 46, 0, 0, 0),
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            hintText: "Search medical..",
                            prefixIcon: const Icon(Icons.search,
                                color: Color.fromARGB(216, 139, 137, 137)),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.tune,
                                    color: Color.fromARGB(216, 139, 137, 137))),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height / 30, 20, 0, 0),
                        child: const Text('Category',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  // Single child scroll view is used for to scroll the categories,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Gestor detector used for clickable the container ,and this container have the-
                        // Column Row And container inside of the container have rus Icon , Design Text, Add Icon etc...
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 31,
                                      width: 31,
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 15, 0, 0),
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/fa_paint-brush.png'))),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 10, 0, 0),
                                      child: const Text(
                                        'Design',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 0),
                                      child: const Text(
                                        '5 Task',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            // Container have  color alignment decorations,
                            margin: EdgeInsets.fromLTRB(
                                screenwidth / 15, screenheight / 60, 0, 0),
                            height: screenheight / 5,
                            width: screenwidth / 3,
                            decoration: const BoxDecoration(
                              // color: Colors.white,
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 224, 35, 98),
                                    Color.fromARGB(255, 230, 146, 166),
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                        // ________________________this getsure detector second container containing parts group discussion icon meeting text etc...,
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 15, 0, 0),
                                      height: 32,
                                      width: 32,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/healthicons_group-discussion-meeting.png'))),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 10, 0, 0),
                                      child: const Text(
                                        'Meeting',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 0),
                                      child: const Text(
                                        '1 Task',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(
                                30, screenheight / 60, 0, 0),
                            height: screenheight / 5,
                            width: screenwidth / 3,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 200, 142, 54),
                                      Color.fromARGB(255, 233, 198, 123),
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 15, 0, 0),
                                      height: 31,
                                      width: 31,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/carbon_machine-learning-model.png'))),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 10, 0, 0),
                                      child: const Text(
                                        'Learning',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 10, 0, 0),
                                      child: const Text(
                                        '2 Task',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 30,
                                        ))
                                  ],
                                )
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(
                                30, screenheight / 60, 0, 0),
                            height: screenheight / 5,
                            width: screenwidth / 3,
                            decoration: const BoxDecoration(
                                // color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 96, 198, 100),
                                      Color.fromARGB(255, 102, 224, 106)
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                          ),
                        )
                      ],
                    ),
                  ),
                  // _________________________________bottom container___________________________________________________
                  Consumer<ShowModalProvider>(builder: (context, show, child) {
                    return GestureDetector(
                      onTap: () {
                        show.ShowModalBottomSheet(context);
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 25),
                            height: screenheight / 2,
                            width: screenwidth,
                            // color: Colors.white,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(52),
                                    topRight: Radius.circular(52))),

                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.6,
                                              10,
                                              0,
                                              0),
                                          height: 5,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 79, 74, 74),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          38, 20, 0, 0),
                                      child: const Text("Today's Task",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'R.font.segoe ui')),
                                    ),
                                    Consumer<ProviderSetting>(
                                        builder: (context, data, child) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            left: screenwidth / 2.5, top: 20),
                                        height: 22,
                                        width: 22,
                                        // color: Colors.blueGrey,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 168, 145, 233),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),

                                        child: Center(
                                            child:
                                                Text('${data.tasks.length}')),
                                      );
                                    })
                                  ],
                                ),
                                SizedBox(
                                  height: 270,
                                  child: Listing(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 45,
          width: 45,
          child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(138, 50, 203, 1),
              onPressed: () {
                ShowDialogue(context);
                Provider.of<LoginProvider>(context);
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }
}
