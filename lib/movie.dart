class Movie {
  late int id;
  late String title;
  late double voteAverage;
  late String releaseDate;
  late String overview;
  late String posterPath;

  Movie(this.id, this.overview, this.posterPath, this.releaseDate, this.title,
      this.voteAverage);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['voteAverage'];
    releaseDate = parsedJson['releaseDate'];
    overview = parsedJson['overview'];
    posterPath = parsedJson['posterPath'];
  }
}
