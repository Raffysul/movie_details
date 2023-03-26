import 'dart:convert';
import 'package:http/http.dart' as http;

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  //final List<dynamic> cast;

  Movie(this.id, this.title, this.posterPath, this.overview, this.backdropPath,
      this.releaseDate, this.voteAverage);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      json['id'],
      json['title'],
      'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      json['overview'],
      'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
      json['release_date'],
      //json['poster_path'],
      json['vote_average'],
      //json['credits']['cast'],

    );
  }
}

class MovieApi {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'e46116d17f95c5f29ed7ce0408bce9a5';

  static Future<List<Movie>> getPopularMovies() async {
    const url =
        '$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final moviesJson = jsonResponse['results'] as List;
      return moviesJson.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }
}
