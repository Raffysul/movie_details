// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// import '../model/movies.dart';
//
// class MovieApi {
//   static const String _baseUrl = 'https://api.themoviedb.org/3';
//   static const String _apiKey = 'e46116d17f95c5f29ed7ce0408bce9a5';
//
//   static Future<List<Movie>> getMovieDetails() async {
//     const url =
//         '$_baseUrl/movie/359724?api_key=$_apiKey&language=en-US';
//     //https://api.themoviedb.org/3/movie/359724?api_key=e46116d17f95c5f29ed7ce0408bce9a5&language=en-US
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//       final moviesJson = jsonResponse['results'] as List;
//       return moviesJson.map((json) => Movie.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load movie details');
//     }
//   }
// }
import 'dart:convert';

import '../model/movies.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/359724?api_key=e46116d17f95c5f29ed7ce0408bce9a5&language=en-US'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    final movie = Movie(
        title: jsonData['title'],
        rating: jsonData['vote_average'].toDouble(),
        imagePath: 'https://image.tmdb.org/t/p/w500${jsonData['poster_path']}');

    return [movie];
  } else {
    throw Exception('Failed to load movies');
  }
}
