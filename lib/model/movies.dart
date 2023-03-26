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


