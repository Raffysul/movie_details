import 'package:flutter/material.dart';

import '../model/movies.dart';
import '../service/remote_services.dart';
import 'movie_details.dart';

class InTheaterScreen extends StatefulWidget {
  const InTheaterScreen({Key? key}) : super(key: key);

  @override
  State<InTheaterScreen> createState() => _InTheaterScreenState();
}

class _InTheaterScreenState extends State<InTheaterScreen> {
  var list = ["Action", "Crime", "Comedy", "Drama"];

  // List<Movie> _movies = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _loadMovies();
  // }
  //
  // Future<void> _loadMovies() async {
  //   try {
  //     final movies = await MovieApi.getMovieDetails();
  //     setState(() {
  //       _movies = movies;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: fetchMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final movie = snapshot.data![0];
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          for (var item in list)
                            Container(
                              height: 30,
                              width: 90,
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                  shape: BoxShape.rectangle),
                              child: Center(
                                child: Text(
                                  item,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const MoviesScreen()),
                      );
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Card(
                        elevation: 10,
                        child: Image.network(
                          movie.imagePath,
                          // height: 300,
                          // width: 300,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF12153D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFFFCC419),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        movie.rating.toString(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
          // return SingleChildScrollView(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const SizedBox(
          //         height: 30,
          //       ),
          //       Container(
          //         margin: const EdgeInsets.all(20),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(24),
          //         ),
          //         child: Card(
          //             elevation: 5.0,
          //             child: Image.network(
          //               movie.imagePath,
          //               // height: 300,
          //               // width: 300,
          //               fit: BoxFit.contain,
          //               alignment: Alignment.center,
          //             )),
          //       ),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Text(movie.title),
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Text(movie.rating.toString())
          //     ],
          //   ),
          // );
        });
  }
}
