import 'package:flutter/material.dart';
import 'package:movies_hub/http_helper.dart';
import 'package:movies_hub/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  late HttpHelper httpHelper;
  late int moviesCount;
  late List movies;

  Future initialize() async {
    movies = List.empty();
    movies = await httpHelper.getUpcoming();

    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    httpHelper = HttpHelper();
    moviesCount = 0;
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movies',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
            itemCount: moviesCount,
            itemBuilder: (BuildContext context, int position) {
              if (movies[position].posterPath != null) {
                image = NetworkImage('$iconBase${movies[position].posterPath}');
              } else {
                image = NetworkImage(defaultImage);
              }
              return Card(
                color: Colors.white,
                elevation: 1.0,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: image,
                  ),
                  title: Text(movies[position].title),
                  subtitle: Text(
                      'Released:  ${movies[position].releaseDate} - Vote: ${movies[position].voteAverage.toString()}'),
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => MovieDetail(movies[position]));

                    Navigator.push(context, route);
                  },
                ),
              );
            }));
  }
}
