class Movie {
  final int id;
  final String title;
  final String overview;
  final String imagePath;
  final String releaseDate;

  Movie( 
      {required this.id,
      required this .title,
      required this.overview,
      required this.imagePath,
      required this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        imagePath: json['poster_path'],
        releaseDate: json['release_date']);
  }
}
