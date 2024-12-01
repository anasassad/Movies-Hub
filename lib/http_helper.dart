import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_hub/movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=231dfba16c3d3c301e9f4ee214c2fab1';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=231dfba16c3d3c301e9f4ee214c2fab1&query=';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';

  Future<List> getUpcoming() async {
    final String upcoming = '$urlBase$urlUpcoming$urlKey$urlLanguage';
    final Uri uri = Uri.parse(upcoming);

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final jsonReponse = json.decode(response.body);
      final moviesMap = jsonReponse['results'];

      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      return List.empty();
    }
  }

  Future<List> findMovies(String title) async {
    final String query = '$urlSearchBase$title';
    final Uri uri = Uri.parse(query);

    http.Response response = await http.get(uri);

    if (response.statusCode == HttpStatus.ok) {
      final jsonReponse = json.decode(response.body);
      final moviesMap = jsonReponse['results'];

      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      return List.empty();
    }
  }
}
