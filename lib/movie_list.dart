import 'package:flutter/material.dart';
import 'package:movies_hub/http_helper.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late HttpHelper httpHelper;
  late String result;

  @override
  void initState() {
    httpHelper = HttpHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    httpHelper.getUpcoming().then(
      (value) {
        setState(() {
          result = value;
        });
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Movies',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Text(result));
  }
}
