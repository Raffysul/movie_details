import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'in-theater_screen.dart';
// import 'package:my_movie_app/views/home_screen.dart';
// import 'package:my_movie_app/views/in_theater_screen.dart';
//
// import '../models/movies.dart';
// import '../services/remote_services.dart';
//import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  final String apiKey = 'e46116d17f95c5f29ed7ce0408bce9a5';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNDYxMTZkMTdmOTVjNWYyOWVkN2NlMDQwOGJjZTlhNSIsInN1YiI6IjY0MWMzNmQxZDc1YmQ2MjQzZTRmN2JjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.79H97FGxyfCmnoxwQOPV7xAia8lVH3NZoUy6U6GR9-A';


  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
    });
    print(trendingMovies);
  }
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

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
              //controller: _tabcontroller,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFFFE6D8E),
              labelStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2.0,
              //indicatorPadding: EdgeInsets.all(8),
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
          body: TabBarView(children: [
            InTheaterScreen(trending: trendingMovies[index][""],),
            // Center(
            //     child: Text(
            //   'In Theater Screen',
            //   style: TextStyle(color: Colors.yellow, fontSize: 25),
            // )),
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
