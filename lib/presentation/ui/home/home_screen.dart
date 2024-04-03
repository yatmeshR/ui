import 'package:just_uis/presentation/ui/tab/detail_tab.dart';
import 'package:just_uis/presentation/ui/tab/info_tab.dart';
import 'package:just_uis/presentation/ui/tab/save_tab.dart';
import 'package:just_uis/presentation/widget/my_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> allTabs = [
    myTab(Icons.shopping_bag),
    myTab(Icons.request_page),
    myTab(Icons.save),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allTabs.length,
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF357F8B),
                    backgroundImage: AssetImage('assets/pfp_nameholder.png'),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            '10',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text('Projects',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text('3',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          Text('Work',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Icon(Icons.person),
                          Text('Contact',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                child: Text(
                  'Hey,',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                child: Text(
                  "I'm Srishti Doshi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Student',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(Icons.circle, size: 10),
                    ),
                    Text(
                      'Fashion Designer',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Text(
                      'Stylist',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: allTabs),
              ),
              //tabbar views
              Expanded(
                child: TabBarView(
                  children: [DetailTab(), InfoTab(), SaveTab()],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
