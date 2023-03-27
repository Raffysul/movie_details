import 'package:flutter/material.dart';
import 'package:movie_details/views/home_page.dart';
import 'package:provider/provider.dart';

import '../model/movies.dart';
import '../provider/movie_provider.dart';
//import 'movie_details.dart';

class InTheaterScreen extends StatefulWidget {
  const InTheaterScreen({Key? key}) : super(key: key);

  @override
  State<InTheaterScreen> createState() => _InTheaterScreenState();
}

class _InTheaterScreenState extends State<InTheaterScreen> {
  var list = ["Action", "Crime", "Comedy", "Drama"];

  @override
  void initState() {
    super.initState();

    Provider.of<MovieProvider>(context, listen: false).getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      if (movieProvider.movie == null) {
        return const CircularProgressIndicator();
      }

      final Movie movie = movieProvider.movie!;
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
                child: Row(
                  children: [
                    for (var item in list)
                      Container(
                        height: 30,
                        width: 90,
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
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
                )),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                });
              },
              child: Image.network(
                movie.imageUrl,
                height: 300,
                width: 300,
                alignment: Alignment.center,
                fit: BoxFit.contain,
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
                    'Rating: ${movie.rating}',
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
    });
  }
}

/*@override
Widget build(BuildContext context) {
  return Center(
    child: Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
        if (movieProvider.movie == null) {
          return const CircularProgressIndicator();
        }

        final Movie movie = movieProvider.movie!;

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                movie.imageUrl,
                height: 300,
              ),
              const SizedBox(height: 16),
              Text(
                movie.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Rating: ${movie.rating}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Release Date: ${movie.releaseDate}',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Runtime: ${movie.runtime} minutes',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                movie.overview,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Text(
                'Genres: ${movie.genres.join(", ")}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    ),
  );
}*/
