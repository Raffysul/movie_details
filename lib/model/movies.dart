// class Movie {
//   final int id;
//   final String title;
//   final String posterPath;
//   final String overview;
//   final String backdropPath;
//   final String releaseDate;
//   final double voteAverage;
//   //final List<dynamic> cast;
//
//   Movie(this.id, this.title, this.posterPath, this.overview, this.backdropPath,
//       this.releaseDate, this.voteAverage);
//
//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       json['id'],
//       json['original_title'],
//       'https://image.tmdb.org/t/p/w500${json['poster_path']}',
//       json['overview'],
//       'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
//       json['release_date'],
//       //json['poster_path'],
//       json['vote_average'],
//       //json['credits']['cast'],
//
//     );
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final double rating;
  final String imagePath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String runTime;
  List<dynamic> genres;

  Movie({
    required this.title,
    required this.rating,
    required this.imagePath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.genres,
  });

}

