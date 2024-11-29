import 'package:flutter/material.dart';
import 'package:movies_hub/http_helper.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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
              return Card(
                color: Colors.white,
                elevation: 1.0,
                child: ListTile(
                  title: Text(movies[position].title),
                  subtitle: Text(
                      'Released:  ${movies[position].releaseDate} - Vote: ${movies[position].voteAverage.toString()}'),
                ),
              );
            }));
  }
}
