import 'package:flutter/material.dart';
import 'in-theater_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 70,
            leading: const Icon(
              Icons.format_align_left,
              size: 25,
              color: Colors.black,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFFFE6D8E),
              labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.0,
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'In Theater',
                ),
                Tab(
                  text: 'Box Office',
                ),
                Tab(
                  text: 'Coming Soon',
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: const TabBarView(children: [
            InTheaterScreen(),
            Center(
                child: Text(
              'Box Office screen',
              style: TextStyle(color: Colors.yellow, fontSize: 25),
            )),
            Center(
                child: Text(
              'Coming Soon screen',
              style: TextStyle(color: Colors.green, fontSize: 25),
            )),
          ])),
    );
  }
}
