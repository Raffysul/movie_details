import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/movies.dart';

class MovieProvider extends ChangeNotifier {
  Movie? _movie;

  Movie? get movie => _movie;

  Future<void> getMovie() async {
    const String apiUrl =
        "https://api.themoviedb.org/3/movie/359724?api_key=e46116d17f95c5f29ed7ce0408bce9a5&language=en-US";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final String title = jsonResponse['title'];
      final String overview = jsonResponse['overview'];
      final String releaseDate = jsonResponse['release_date'];
      final String imageUrl =
          'https://image.tmdb.org/t/p/w500${jsonResponse['poster_path']}';
      final String backdropUrl =
          'https://image.tmdb.org/t/p/w500${jsonResponse['backdrop_path']}';
      final double rating = jsonResponse['vote_average'].toDouble();
      final int runtime = jsonResponse['runtime'];
      final List<String> genres = List<String>.from(
          jsonResponse['genres'].map((genre) => genre['name']));

      _movie = Movie(
        title: title,
        overview: overview,
        releaseDate: releaseDate,
        imageUrl: imageUrl,
        backdropUrl: backdropUrl,
        rating: rating,
        runtime: runtime,
        genres: genres,
      );

      notifyListeners();
    } else {
      throw Exception('Failed to load movie: ${response.statusCode}');
    }
  }
}
