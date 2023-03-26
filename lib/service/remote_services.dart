import 'dart:convert';

import '../model/movies.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/359724?api_key=e46116d17f95c5f29ed7ce0408bce9a5&language=en-US'));
  String minutes ="minutes";
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    final movie = Movie(
      title: jsonData['title'],
      rating: jsonData['vote_average'].toDouble(),
      imagePath: 'https://image.tmdb.org/t/p/w500${jsonData['poster_path']}',
      backdropPath: 'https://image.tmdb.org/t/p/w500${jsonData['backdrop_path']}',
      overview: jsonData['overview'],
      releaseDate: jsonData['release_date'],
      runTime: jsonData['runtime$minutes'],
      genres: jsonData['genres'],
    );

    return [movie];
  } else {
    throw Exception('Failed to load movies');
  }
}
